<?php

namespace App\Http\Controllers\Api;

use App\Models\Role;
use App\Models\User;
use App\Models\Orders;
use App\Models\Projects;
use App\Models\ProjectMeta;
use Illuminate\Http\Request;
use App\Models\DocumentReceipt;
use Illuminate\Support\Facades\DB;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Mail;
use App\Notifications\ProjectNotification;
use App\Notifications\ProjectEmailNotification;

class OrdersController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        DB::beginTransaction();
        try {
            $project = Projects::where('nib', $request->get('nib'))->first();
            // dd($project);
            if ($project) {
                $user = User::find($project->user_id);
                $no_berkas = Projects::where('no_berkas', $request->get('no_berkas'))->first();
                if ($no_berkas) {
                    $project->update([
                        "nib" => $request->get('nib'),
                        "npwp" => $request->get('npwp'),
                        "kd_produk" => $request->get('kd_produk'),
                        "nama_cp" => $request->get('nama_cp'),
                        "jabatan_cp" => $request->get('jabatan_cp'),
                        "no_hp_cp" => $request->get('no_hp_cp'),
                        "alamat_kantor" => $request->get('alamat_kantor'),
                        "alamat_pabrik" => $request->get('alamat_pabrik'),
                        "nama_perusahaan" => $request->get('nama_perusahaan'),
                    ]);
                } else {
                    $project = Projects::create([
                        "user_id" => $project->user_id,
                        "no_berkas" => $request->get('no_berkas'),
                        "nib" => $request->get('nib'),
                        "npwp" => $request->get('npwp'),
                        "kd_produk" => $request->get('kd_produk'),
                        "nama_cp" => $request->get('nama_cp'),
                        "jabatan_cp" => $request->get('jabatan_cp'),
                        "no_hp_cp" => $request->get('no_hp_cp'),
                        "alamat_kantor" => $request->get('alamat_kantor'),
                        "alamat_pabrik" => $request->get('alamat_pabrik'),
                        "nama_perusahaan" => $request->get('nama_perusahaan'),
                        "stage" => 1,
                        "status" => 100,
                    ]);
                }
            } else {
                $user = new User();
                $user->name = $request->get('nama_cp');
                $user->contact = 0;
                $user->email = $request->get('email_cp');

                $role = Role::find(5);
                $user->assignRole($role->name);
                $user->role_id = 5;
                
                $user->status = "active";
                // $password = substr(md5($request->get('email_cp')), 0, 8);
                $password = 'password';
                $user->password = bcrypt($password);

                $user->save();

                $project = Projects::create([
                    "user_id" => $user->id,
                    "no_berkas" => $request->get('no_berkas'),
                    "nib" => $request->get('nib'),
                    "npwp" => $request->get('npwp'),
                    "kd_produk" => $request->get('kd_produk'),
                    "nama_cp" => $request->get('nama_cp'),
                    "jabatan_cp" => $request->get('jabatan_cp'),
                    "no_hp_cp" => $request->get('no_hp_cp'),
                    "alamat_kantor" => $request->get('alamat_kantor'),
                    "alamat_pabrik" => $request->get('alamat_pabrik'),
                    "nama_perusahaan" => $request->get('nama_perusahaan'),
                    "stage" => 1,
                    "status" => 100,
                ]);
                                    
                // Mail::send('emails.welcome', ['name' => $request->get('nama_cp'), 'email' => $request->get('email_cp'), 'password' => $password], function ($message) use ($request) {
                //     $message->from('no-reply@site.com', "Site name");
                //     $message->subject("Welcome to site name");
                //     $message->to($request->get('email_cp'));
                // });
            }
            
            Orders::create([
                'siinas_data' => $request->all(),
                "no_berkas" => $request->get('no_berkas'),
                "nib" => $request->get('nib'),
                "npwp" => $request->get('npwp'),
                "verifikator" => $request->get('verifikator'),
                "kd_produk" => $request->get('kd_produk'),
                "nama_cp" => $request->get('nama_cp'),
                "jabatan_cp" => $request->get('jabatan_cp'),
                "no_hp_cp" => $request->get('no_hp_cp'),
                "alamat_kantor" => $request->get('alamat_kantor'),
                "alamat_pabrik" => $request->get('alamat_pabrik'),
            ]);

            $documentReceipt = new DocumentReceipt();
            $documentReceipt->project_id = $project->id;
            $documentReceipt->stage = 1;
            $documentReceipt->ip = $request->getClientIp();
            $documentReceipt->payload = json_encode($request->all());
            $documentReceipt->end_point = url('api/v1/permohonan');
            $documentReceipt->siinas_response = json_encode([
                "status" => "1",
                "data" => "ada",
                "tahap" => "1",
                "message" => "ok",
                "url" => url("/projects/{$project->id}"),
            ], JSON_PRETTY_PRINT);
            $documentReceipt->siinas_post_at = now();

            $documentReceipt->save();

            $admin = User::find(2);

            $details = [
                'from' => $user->id,
                'message' => 'Submit Dokumen Baru ' . $project->no_berkas,
                'actionURL' => route('projects.index', $project->id)
            ];

            $admin->notify(new ProjectNotification($details));

            DB::commit();

            return response()->json([
                "status" => "1",
                "data" => "ada",
                "tahap" => "1",
                "message" => "ok",
                "url" => url("/projects/{$project->id}"),
            ]);
        } catch (\Throwable $throwable) {
            DB::rollback();
            // return response()->json([
            //     "status" => 0,
            //     "data" => "tidak ada",
            //     "tahap" => "1",
            //     "message" => "error: nomor berkas tidak dapat dibaca",
            //     "url" => null,
            // ]);
            return response()->json([
                "status" => 0,
                "data" => "tidak ada",
                "tahap" => "1",
                "message" => "error: " . $throwable->getMessage(),
                "url" => null,
            ]);
        }
    }

    public function permohonan(Request $request)
    {
        $return = [];
        switch ($request->tahap) {
            case '3': $return = $this->tahap3($request); break;
            case '5': $return = $this->tahap5($request); break;
            case '7': $return = $this->tahap7($request); break;
            case '8': $return = $this->tahap8($request); break;
            case '9': $return = $this->tahap9($request); break;
            case '11': $return = $this->tahap11($request); break;
            case '12': $return = $this->tahap12($request); break;
            default: break;
        }

        $documentReceipt = new DocumentReceipt();
        $documentReceipt->project_id = Projects::where('no_berkas', (int)$request->get('no_berkas'))->first()?->id;
        $documentReceipt->stage = $request->tahap;
        $documentReceipt->ip = $request->getClientIp();
        $documentReceipt->end_point = url('api/v1/permohonan');
        $documentReceipt->payload = json_encode($request->all());

        $documentReceipt->siinas_response = $return;

        $documentReceipt->siinas_post_at = now();

        $documentReceipt->save();   

        return $return;
    }

    public function tahap3(Request $request)
    {
        try {
            $docNumber = (int)$request->get('no_berkas');
            $project = Projects::where('no_berkas', $docNumber)->first();
            if ($project) {
                $project->stage = 3;
                $project->save();
                return response()->json([
                    "status" => "1",
                    "data" => "ada",
                    "tahap" => "3",
                    "message" => "ok"
                ]);
            }

            return response()->json([
                "status" => 0,
                "data" => "tidak ada",
                "tahap" => "3",
                "message" => "error: nomor berkas tidak dapat dibaca",
            ]);
        } catch (\Throwable $throwable) {
            return response()->json([
                "status" => 0,
                "data" => "tidak ada",
                "tahap" => "3",
                "message" => "error: " . $throwable->getMessage(),
                "url" => null,
            ]);
        }
    }

    public function tahap5(Request $request)
    {
        try {
            $docNumber = (int)$request->get('no_berkas');
            $project = Projects::where('no_berkas', $docNumber)->first();
            if ($project) {
                $qc = User::find($project->qc->qc);
                $admin = User::find(2);
                
                $details = [
                    'from' => 'Siinas',
                    'message' => ($request->get('status') == "0" ? 'Menolak' : 'Menerima') . ' Tahap 5 untuk berkas ' . $project->no_berkas,
                    'actionURL' => route('projects.index', $project->id)
                ];

                if ($request->get('status') == "0") {
                    // $project->status = 201;
                    // $qc->notify(new ProjectNotification($details));
                } else {
                    $project->status = 500;
                }

                $project->stage = 5;
                $project->status_siinas = $request->get('status');
                $project->save();

                $meta = ProjectMeta::firstOrNew(['project_id' => $project->id]);
                $meta->alasan_tolak = $request->get('alasan_tolak');
                $meta->save();

                $admin->notify(new ProjectNotification($details));

                return response()->json([
                    "status" => $request->get('status'),
                    "data" => "ada",
                    "tahap" => "5",
                    "message" => "ok"
                ]);
            }

            return response()->json([
                "status" => 0,
                "data" => "tidak ada",
                "tahap" => "5",
                "message" => "error: nomor berkas tidak dapat dibaca",
            ]);
        } catch (\Throwable $throwable) {
            return response()->json([
                "status" => 0,
                "data" => "tidak ada",
                "tahap" => "5",
                "message" => "error: " . $throwable->getMessage(),
                "url" => null,
            ]);
        }
    }

    public function tahap7(Request $request)
    {
        try {
            $docNumber = (int)$request->get('no_berkas');
            $project = Projects::where('no_berkas', $docNumber)->first();
            if ($project) {
                if ($request->get('status') == "0") {
                    $project->status = 500;
                }else{
                    $project->status = 700;
                }
                $project->stage = 7;
                $project->status_siinas = $request->get('status');
                $project->save();

                $meta = ProjectMeta::firstOrNew(['project_id' => $project->id]);
                $meta->alasan = $request->get('alasan');
                $meta->save();

                $admin = User::find(2);

                $details = [
                    'from' => 'Siinas',
                    'message' => ($request->get('status') == "0" ? 'Menolak':'Menerima'). ' Tahap 7 untuk berkas ' . $project->no_berkas,
                    'actionURL' => route('projects.index', $project->id)
                ];

                $admin->notify(new ProjectNotification($details));

                return response()->json([
                    "status" => $request->get('status'),
                    "data" => "ada",
                    "tahap" => "7",
                    "message" => "ok"
                ]);
            }

            return response()->json([
                "status" => 0,
                "data" => "tidak ada",
                "tahap" => "7",
                "message" => "error: nomor berkas tidak dapat dibaca",
            ]);
        } catch (\Throwable $throwable) {
            return response()->json([
                "status" => 0,
                "data" => "tidak ada",
                "tahap" => "7",
                "message" => "error: " . $throwable->getMessage(),
                "url" => null,
            ]);
        }
    }

    public function tahap8(Request $request)
    {
        try {
            $docNumber = (int)$request->get('no_berkas');
            $project = Projects::where('no_berkas', $docNumber)->first();
            if ($project) {
                $project->status = 800;
                $project->stage = 8;
                $project->save();
                $admin = User::find(2);
                
                $meta = ProjectMeta::firstOrNew(['project_id' => $project->id]);
                $meta->nm_reviewer = $request->get('nm_reviewer');
                $meta->tgl_rencana_review = $request->get('tgl_rencana_review');
                $meta->save();

                $details = [
                    'from' => 'Siinas',
                    'message' => 'Submit Tahap 8 untuk berkas ' . $project->no_berkas,
                    'actionURL' => route('projects.index', $project->id)
                ];

                $admin->notify(new ProjectNotification($details));

                return response()->json([
                    "status" => "1",
                    "data" => "ada",
                    "tahap" => "8",
                    "message" => "ok"
                ]);
            }

            return response()->json([
                "status" => 0,
                "data" => "tidak ada",
                "tahap" => "8",
                "message" => "error: nomor berkas tidak dapat dibaca",
            ]);
        } catch (\Throwable $throwable) {
            return response()->json([
                "status" => 0,
                "data" => "tidak ada",
                "tahap" => "8",
                "message" => "error: " . $throwable->getMessage(),
                "url" => null,
            ]);
        }
    }

    public function tahap9(Request $request)
    {
        try {
            $docNumber = (int)$request->get('no_berkas');
            $project = Projects::where('no_berkas', $docNumber)->first();
            if ($project) {
                if ($request->get('status') == "0") {
                    $project->status = 1000;
                } else {
                    $project->status = 900;
                }
                $project->status_siinas = $request->get('status');
                $project->stage = 9;
                $project->save();
                
                $meta = ProjectMeta::firstOrNew(['project_id' => $project->id]);
                $meta->tgl_pelaksanaan_reviu = $request->get('tgl_pelaksanaan_reviu');
                $meta->mom = $request->get('mom');
                $meta->catatan = $request->get('catatan');
                $meta->save();

                $admin = User::find(2);

                $details = [
                    'from' => 'Siinas',
                    'message' => ($request->get('status') == "0" ? 'Menolak' : 'Menerima') . ' Tahap 9 untuk berkas ' . $project->no_berkas,
                    'actionURL' => route('projects.index', $project->id)
                ];

                $admin->notify(new ProjectNotification($details));

                return response()->json([
                    "status" => $request->get('status'),
                    "data" => "ada",
                    "tahap" => "9",
                    "message" => "ok"
                ]);
            }

            return response()->json([
                "status" => 0,
                "data" => "tidak ada",
                "tahap" => "9",
                "message" => "error: nomor berkas tidak dapat dibaca",
            ]);
        } catch (\Throwable $throwable) {
            return response()->json([
                "status" => 0,
                "data" => "tidak ada",
                "tahap" => "9",
                "message" => "error: " . $throwable->getMessage(),
                "url" => null,
            ]);
        }
    }

    public function tahap11(Request $request)
    {
        try {
            $docNumber = (int)$request->get('no_berkas');
            $project = Projects::where('no_berkas', $docNumber)->first();
            if ($project) {
                if ($request->get('status') == "0") {
                    $project->status = 1000;
                } else {
                    $project->status = 1100;
                }
                $project->stage = 11;
                $project->status_siinas = $request->get('status');
                $project->save();

                $meta = ProjectMeta::firstOrNew(['project_id' => $project->id]);
                $meta->alasan_tidak_sesuai = $request->get('alasan_tidak_sesuai');
                // $meta->no_tanda_sah = $request->get('no_tanda_sah');
                // $meta->tgl_tanda_sah = $request->get('tgl_tanda_sah');
                // $meta->tgl_expire = $request->get('tgl_expire');
                // $meta->url_qrcode = $request->get('url_qrcode');
                $meta->save();

                $admin = User::find(2);

                $details = [
                    'from' => 'Siinas',
                    'message' => ($request->get('status') == "0" ? 'Menolak' : 'Menerima'). ' Tahap 11 untuk berkas ' . $project->no_berkas,
                    'actionURL' => route('projects.index', $project->id)
                ];

                $admin->notify(new ProjectNotification($details));

                return response()->json([
                    "status" => $request->get('status'),
                    "data" => "ada",
                    "tahap" => "11",
                    "message" => "ok"
                ]);
            }

            return response()->json([
                "status" => 0,
                "data" => "tidak ada",
                "tahap" => "11",
                "message" => "error: nomor berkas tidak dapat dibaca",
            ]);
        } catch (\Throwable $throwable) {
            return response()->json([
                "status" => 0,
                "data" => "tidak ada",
                "tahap" => "11",
                "message" => "error: " . $throwable->getMessage(),
                "url" => null,
            ]);
        }
    }

    public function tahap12(Request $request)
    {
        try {
            $docNumber = (int)$request->get('no_berkas');
            $project = Projects::where('no_berkas', $docNumber)->first();
            if ($project) {
                if ($request->get('status') == "0") {
                    $project->status = 1100;
                } else {
                    $project->status = 1200;
                }
                $project->status_siinas = $request->get('status');
                $project->stage = 12;
                $project->save();
                
                $meta = ProjectMeta::firstOrNew(['project_id' => $project->id]);
                $meta->alasan_tolak = $request->get('alasan_tolak');
                $meta->no_tanda_sah = $request->get('no_tanda_sah');
                $meta->tgl_tanda_sah = $request->get('tgl_tanda_sah');
                $meta->tgl_expire = $request->get('tgl_expire');
                $meta->url_sertifikat_terbit = $request->get('url_sertifikat_terbit');
                $meta->save();

                $admin = User::find(2);
                $user = User::find($project->user_id);

                $details = [
                    'from' => 'Siinas',
                    'message' => ($request->get('status') == "0" ? 'Menolak' : 'Menerima'). ' Tahap 12 untuk berkas ' . $project->no_berkas,
                    'actionURL' => route('projects.index', $project->id)
                ];

                $project = [
                    'body' => 'Hi ' . $user->name . ', Sertifikat TKDN anda telah terbit',
                    'line' => 'Mohon segera melakukan pembayaran.',
                    'actionText' => 'Lihat Sertifikat',
                    'actionURL' => $request->get('url_sertifikat_terbit')
                ];

                Mail::send('emails.notify', $details, function ($message) use ($user) {
                    $message->from('no-reply@site.com', "Permohonan TKDN");
                    $message->subject("Sertifikat TKDN");
                    $message->to($user->email);
                });

                $admin->notify(new ProjectNotification($details));
                // $user->notify(new ProjectEmailNotification($project));

                return response()->json([
                    "status" => $request->get('status'),
                    "data" => "ada",
                    "tahap" => "12",
                    "message" => "ok"
                ]);
            }

            return response()->json([
                "status" => 0,
                "data" => "tidak ada",
                "tahap" => "12",
                "message" => "error: nomor berkas tidak dapat dibaca",
            ]);
        } catch (\Throwable $throwable) {
            return response()->json([
                "status" => 0,
                "data" => "tidak ada",
                "tahap" => "12",
                "message" => "error: " . $throwable->getMessage(),
                "url" => null,
            ]);
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Orders  $orders
     * @return \Illuminate\Http\Response
     */
    public function show(Orders $orders)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Orders  $orders
     * @return \Illuminate\Http\Response
     */
    public function edit(Orders $orders)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Orders  $orders
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Orders $orders)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Orders  $orders
     * @return \Illuminate\Http\Response
     */
    public function destroy(Orders $orders)
    {
        //
    }
}
