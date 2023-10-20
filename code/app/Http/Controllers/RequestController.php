<?php

namespace App\Http\Controllers;

use App\Models\Log;
use App\Models\Qcs;
use App\Models\User;
use App\Traits\Util;
use App\Models\Kepala;
use App\Models\Upload;
use App\Models\Asesors;
use App\Models\Projects;
use Illuminate\Support\Str;
use Illuminate\Http\Request;
use App\Models\KelompokBarang;
use App\Models\DocumentReceipt;
use App\Models\ProjectAdditional;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\File;

use Illuminate\Support\Facades\Http;
use Illuminate\Support\Facades\Mail;
use App\Notifications\ProjectNotification;
use App\Notifications\ProjectEmailNotification;

class RequestController extends Controller
{
    use Util;
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $data = Projects::with('statuses', 'logs')
            ->when(auth()->user()->hasRole('assessor'), function ($q) {
                return $q->whereHas('asesors', function ($q) {
                    return $q->where('asesor', '=', auth()->user()->id);
                });
            })
            ->when(auth()->user()->hasRole('guest'), function ($q) {
                return $q->where('user_id', '=', auth()->user()->id);
            })
            ->whereIn('stage', [1, 2])
            ->get();

        $title = "List Permohonan";

        return view('requests.index', compact('data', 'title'));
    }

    public function verifyAdmin($id)
    {
        $project = Projects::with('files', 'orders')->find($id);

        $data = $project->orders->siinas_data;
        
        $title = "Verifikasi Data";

        return view('requests.verify-admin', compact('project', 'data', 'title'));
    }

    public function verifyAdminSubmit(Request $request, $id)
    {
        DB::beginTransaction();
        try {
            $project = Projects::with('data')->find($id);
            if ($request->action == 4) {
                $project->status = 101;
            } else {
                $project->status = 0;
            }
            $project->status_siinas = $request->action;
            $project->save();

            $log = new Log();
            $log->project_id = $id;
            $log->causer = auth()->user()->name;
            $log->notes = $request->alasan_tolak;
            $log->status = $project->stageStatus->name;
            $log->save();
    
            $endPoint = 'http://api.kemenperin.go.id/tkdn/LVIRecieveTahap2.php';
            $payload = [
                "tahap" => 2,
                "verifikator" => "BKI",
                "no_berkas" => $project->no_berkas,
                "status" => $request->action,
                "alasan_tolak" => $request->alasan_tolak ?? '',
                "url_sptjm" => '',
                // "tgl_bast" => now()->format('Y-m-d'),
                "tgl_bast" => '',
            ];
    
            $response = Http::post($endPoint, $payload);
    
            $documentReceipt = new DocumentReceipt();
            $documentReceipt->project_id = $project->id;
            $documentReceipt->stage = 2;
            $documentReceipt->payload = json_encode($payload);
            $documentReceipt->end_point = $endPoint;
            if (is_array($response)) {
                $documentReceipt->siinas_response = json_encode($response, JSON_PRETTY_PRINT);
                $documentReceipt->siinas_message = isset($response['message']) ? $response['message'] : null;
            } else if ($response) {
                $documentReceipt->siinas_response = (string)$response;
            }
    
            if ($response) {
                $documentReceipt->siinas_post_at = now();
            }
    
            $documentReceipt->save();
    
            $user = User::find($project->user_id);
    
            $details = [
                'from' => auth()->id(),
                'message' => ($request->action == 0 ? 'Menolak' : 'Menerima')  . ' Nomor Berkas ' . $project->no_berkas,
                'actionURL' => route('requests.index', $project->id)
            ];

            $user->notify(new ProjectNotification($details));

            if ($project->status == 0) {
                $details = [
                    'body' => 'Hi ' . $user->name . ', Permohonan anda telah ditolak dengan alasan:',
                    'line' => $request->alasan_tolak,
                    'actionText' => null,
                    'actionURL' => null
                ];

                Mail::send('emails.notify', $details, function ($message) use ($project) {
                    $message->from('no-reply@site.com', "Permohonan TKDN");
                    $message->subject("Permohonan TKDN");
                    $message->to($project->user->email);
                });
            }
            DB::commit();
            return redirect('requests')->with('success', 'Data Saved Successfully');
        } catch (\Throwable $th) {
            DB::rollBack();
            return redirect('requests')->with('success', $th->getMessage());
        }
    }

    public function selectAssessor($id)
    {
        $data = Projects::find($id);
        $user = User::all();

        $title = "Pilih Assessor & QC";

        return view('requests.assessor', compact('data', 'user', 'title'));
    }

    public function selectAssessorSubmit(Request $request, $id)
    {
        DB::beginTransaction();
        try {
            $project = Projects::find($request->project_id);
            $project->status = 102;
            $project->save();

            foreach ($request->asesor as $value) {
                $asesor = new Asesors();
                $asesor->project_id = $request->project_id;
                $asesor->asesor = $value;
                $asesor->save();

                $user = User::find($value);

                $details = [
                    'from' => auth()->id(),
                    'message' => 'Submit Dokumen Baru ' . $project->no_berkas,
                    'actionURL' => route('requests.index', $project->id)
                ];

                $user->notify(new ProjectNotification($details));
            }

            foreach ($request->qc as $value) {
                $qc = new Qcs();
                $qc->project_id = $request->project_id;
                $qc->qc = $value;
                $qc->save();

                $user = User::find($value);

                $details = [
                    'from' => auth()->id(),
                    'message' => 'Submit Dokumen Baru ' . $project->no_berkas,
                    'actionURL' => route('requests.index', $project->id)
                ];

                $user->notify(new ProjectNotification($details));
            }

            $kepala = new Kepala();
            $kepala->project_id = $request->project_id;
            $kepala->save();

            $folderPath = public_path('storage/files/project/' . now()->format('dmy') . '_' . $request->project_id);
            if (!File::isDirectory($folderPath)) {
                File::makeDirectory($folderPath, 0777, true, true);
            }

            if (isset($request->surat_tugas)) {
                $this->singleUpload(1, $request->file('surat_tugas'), $request->project_id, 'Surat Tugas', 'internal');
            }

            Mail::send('emails.welcome', ['name' => $project->user->name, 'email' => $project->user->email, 'password' => 'password'], function ($message) use ($project) {
                $message->from('no-reply@site.com', "Permohonan TKDN");
                $message->subject("Informasi Akun Aplikasi TKDN BKI");
                $message->to($project->user->email);
            });

            DB::commit();
            return redirect('requests')->with('success', 'Data Saved Successfully');
        } catch (\Throwable $th) {
            DB::rollback();
            return redirect('requests')->with('error', $th->getMessage());
        }
    }

    public function uploadDocuments($id)
    {
        $project = Projects::with('files')->find($id);

        $data = $project->orders->siinas_data;

        $title = "Lengkapi Dokumen";

        $assessor = DB::table('users')
            ->leftJoin('asesors', 'asesors.asesor', '=', 'users.id')
            ->select('users.id', 'users.name', 'users.contact', 'users.email')
            ->where('asesors.project_id', $id)
            ->get();

        $qc = DB::table('users')
            ->leftJoin('qcs', 'qcs.qc', '=', 'users.id')
            ->select('users.id', 'users.name', 'users.contact', 'users.email')
            ->where('qcs.project_id', $id)
            ->get();

        return view('requests.upload-document', compact('data', 'project', 'title', 'assessor', 'qc'));
    }

    public function uploadDocumentsSubmit(Request $request)
    {
        DB::beginTransaction();
        try {
            $folderPath = public_path('storage/files/project/' . now()->format('dmy') . '_' . $request->project_id);
            if (!File::isDirectory($folderPath)) {
                File::makeDirectory($folderPath, 0777, true, true);
            }

            if (isset($request->sptjm)) {
                $this->singleUpload(1, $request->file('sptjm'), $request->project_id, 'SPTJM', 'internal');
            }


            foreach ($request->file_name as $k => $files) {
                $this->singleUpload(1, $request->file('foto')[$k], $request->project_id, 'Foto', 'foto', $k);
                foreach ($files as $key => $value) {
                    if (isset($request->file('file')[$k][$key])) {
                        $singleUpload = $this->singleUpload(1, $request->file('file')[$k][$key], $request->project_id, $value, 'project', $k);

                        $upload = Upload::find($singleUpload->id);
                        $upload->number = $request->number[$k][$key];
                        $upload->valid_since = $request->valid_since[$k][$key];
                        $upload->valid_until = $request->valid_until[$k][$key];
                        $upload->save();
                    }
                }
            }

            // if (isset($request->aspek_pemasaran)) {
            //     $this->singleUpload(2, $request->file('aspek_pemasaran'), $request->project_id, 'Aspek Pemasaran', 'project');
            // }

            // if (isset($request->perhitungan_tkdn)) {
            //     $this->singleUpload(3, $request->file('perhitungan_tkdn'), $request->project_id, 'Perhitungan TKDN Pemohon', 'project');
            // }

            // if (isset($request->dokumen_lainnya)) {
            //     $this->singleUpload(4, $request->file('dokumen_lainnya'), $request->project_id, 'Dokumen Lainnya', 'project');
            // }

            $projects = Projects::find($request->project_id);

            $log = new Log();
            $log->project_id = $request->project_id;
            $log->causer = auth()->user()->name;
            $log->notes = '';
            $log->status = $projects->stageStatus->name;
            $log->save();

            $projects->status = 103;
            $projects->save();
            foreach ($projects->asesors as $value) {
                $user = User::find($value->asesor);

                $details = [
                    'from' => auth()->id(),
                    'message' => 'Pemohon Dengan No Dokumen ' . $projects->no_berkas . ' Telah Melengkapi Dokumen',
                    'actionURL' => route('requests.index', $request->project_id)
                ];

                $user->notify(new ProjectNotification($details));
            }
            DB::commit();
            return redirect('requests')->with('success', 'Data Saved Successfully');
        } catch (\Exception $e) {
            DB::rollBack();
            return redirect('requests')->with('error', $e->getMessage());
        }
    }

    public function detail($id)
    {
        // $project = Projects::with('orders')->find($id);
        $project = Projects::with('files')->find($id);

        $data = $project->orders->siinas_data;

        $assessor = DB::table('users')
            ->leftJoin('asesors', 'asesors.asesor', '=', 'users.id')
            ->select('users.id', 'users.name', 'users.contact', 'users.email')
            ->where('asesors.project_id', $id)
            ->get();

        $qc = DB::table('users')
            ->leftJoin('qcs', 'qcs.qc', '=', 'users.id')
            ->select('users.id', 'users.name', 'users.contact', 'users.email')
            ->where('qcs.project_id', $id)
            ->get();

        $title = "Detail";

        return view('requests.detail', compact('project', 'data', 'title', 'assessor', 'qc'));

        // return view('projects.detail', compact('data'));
    }

    public function assessorVerify($id)
    {
        // $project = Projects::with('orders')->find($id);
        $project = Projects::with('files')->find($id);

        $data = $project->orders->siinas_data;

        $kelompok_barang = KelompokBarang::all();

        $title = "Verifikasi Kelengkapan Dokumen";

        $assessor = DB::table('users')
        ->leftJoin('asesors', 'asesors.asesor', '=', 'users.id')
        ->select('users.id', 'users.name', 'users.contact', 'users.email')
        ->where('asesors.project_id', $id)
        ->get();

    $qc = DB::table('users')
        ->leftJoin('qcs', 'qcs.qc', '=', 'users.id')
        ->select('users.id', 'users.name', 'users.contact', 'users.email')
        ->where('qcs.project_id', $id)
        ->get();

        return view('requests.verify', compact('project', 'data', 'kelompok_barang', 'title', 'assessor', 'qc'));
    }

    public function assessorVerifySubmit(Request $request, $id)
    {
        DB::beginTransaction();
        try {
            $project = Projects::find($id);
            $asesor = Asesors::where('project_id', $id)->where('asesor', auth()->user()->id)->first();

            $asesor->asesor_status = $request->action;
            $asesor->asesor_note = $request->note;
            $asesor->save();
            if ($request->action == 0 || $request->action == 2) {
                $project->status_siinas = $request->action;
                $project->status = 102;
                $project->save();
            } else {
                $project->status = 104;
                $project->status_siinas = $request->action;
                $project->judul = $request->judul;
                $project->bast_no = $request->bast_no;
                $project->bast_date = $request->bast_date;
                $project->no_laporan = $request->no_laporan;
                $project->bidang_usaha = $request->bidang_usaha;
                $project->no_referensi = $request->no_referensi;
                $project->save();

                $folderPath = public_path('storage/files/project/' . now()->format('dmy') . '_' . $id);
                if (!File::isDirectory($folderPath)) {
                    File::makeDirectory($folderPath, 0777, true, true);
                }

                if (isset($request->bast)) {
                    $this->singleUpload(1, $request->file('bast'), $id, 'BAST', 'internal');
                }
                if (isset($request->sptjm)) {
                    $this->singleUpload(1, $request->file('sptjm'), $id, 'SPTJM', 'internal');
                }
            }

            $log = new Log();
            $log->project_id = $id;
            $log->causer = auth()->user()->name;
            $log->notes = '';
            $log->status = $project->stageStatus->name;
            $log->save();

            $admin = User::find(2);
            $user = User::find($project->user_id);

            $details = [
                'from' => auth()->id(),
                'message' => ($request->action == 0 ? 'Menolak' : ($request->action == 1 ? 'Menerima' : 'Freeze/Pending'))  . ' Nomor Berkas ' . $project->no_berkas,
                'actionURL' => route('requests.assessor-verify', $project->id)
            ];

            $admin->notify(new ProjectNotification($details));
            $user->notify(new ProjectNotification($details));

            DB::commit();
            return redirect('requests')->with('success', 'Data Saved Successfully');
        } catch (\Throwable $th) {
            DB::rollBack();
            return redirect('requests')->with('success', $th->getMessage());
        }
    }

    public function verifyAdminFinal($id)
    {
        $project = Projects::with('files')->find($id);

        $data = $project->orders->siinas_data;

        $title = "Approval Permohonan Verifikasi";

        $assessor = DB::table('users')
        ->leftJoin('asesors', 'asesors.asesor', '=', 'users.id')
        ->select('users.id', 'users.name', 'users.contact', 'users.email')
        ->where('asesors.project_id', $id)
        ->get();

    $qc = DB::table('users')
        ->leftJoin('qcs', 'qcs.qc', '=', 'users.id')
        ->select('users.id', 'users.name', 'users.contact', 'users.email')
        ->where('qcs.project_id', $id)
        ->get();

        return view('requests.verify-admin-final', compact('project', 'data', 'title', 'assessor', 'qc'));
    }

    public function verifyAdminFinalSubmit(Request $request, $id)
    {
        DB::beginTransaction();
        try {
            $status = $request->action;
    
            $project = Projects::with('data', 'files')->find($id);
            $project->status_siinas = $status;
            if ($status == 0 || $status == 2) {
                $project->status = 103;
                $project->save();

                $user = User::find($project->user_id);
                $details = [
                    'body' => 'Hi ' . $user->name . ', Permohonan anda telah ' . $request->action == 0 ? 'ditolak' : 'dikembalikan' . ' dengan alasan:',
                    'line' => $request->note,
                    'actionText' => null,
                    'actionURL' => null
                ];
                Mail::send('emails.notify', $details, function ($message) use ($user) {
                    $message->from('no-reply@site.com', "Permohonan TKDN");
                    $message->subject("Permohonan TKDN");
                    $message->to($user->email);
                });

            } else {
                $project->status = 200;
                $project->stage = 2;
    
                $project->save();
    
                $path = $project->internal_files?->where('label', 'SPTJM')?->first()->path ?? '';

                $endPoint = 'http://api.kemenperin.go.id/tkdn/LVIRecieveTahap2.php';
                $payload = [
                    "tahap" => 2,
                    "verifikator" => "BKI",
                    "no_berkas" => $project->no_berkas,
                    "status" => $status,
                    "alasan_tolak" => $project->note,
                    "url_sptjm" => $path ? asset('storage/' . $path) : '-',
                    "tgl_bast" => $project->bast_date
                ];
    
                $response = Http::post($endPoint, $payload);
    
                $documentReceipt = new DocumentReceipt();
                $documentReceipt->project_id = $project->id;
                $documentReceipt->stage = 2;
                $documentReceipt->payload = json_encode($payload);
                $documentReceipt->end_point = $endPoint;
                if (is_array($response)) {
                    $documentReceipt->siinas_response = json_encode($response, JSON_PRETTY_PRINT);
                    $documentReceipt->siinas_message = isset($response['message']) ? $response['message'] : null;
                } else if ($response) {
                    $documentReceipt->siinas_response = (string)$response;
                }
    
                if ($response) {
                    $documentReceipt->siinas_post_at = now();
                }
    
                $documentReceipt->save();
            }

            $log = new Log();
            $log->project_id = $id;
            $log->causer = auth()->user()->name;
            $log->notes = $request->note;
            $log->status = $project->stageStatus->name;
            $log->save();

            DB::commit();
            return redirect('requests')->with('success', 'Data Saved Successfully');
        } catch (\Throwable $th) {
            DB::rollBack();
            return redirect('requests')->with('success', $th->getMessage());
        }
    }
}
