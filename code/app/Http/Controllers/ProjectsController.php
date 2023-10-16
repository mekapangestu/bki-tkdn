<?php

namespace App\Http\Controllers;

use App\Models\Qcs;
use App\Models\Tkdn;
use App\Models\User;
use App\Traits\Util;
use App\Models\Kepala;
use App\Models\Orders;
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
use Webklex\PDFMerger\Facades\PDFMergerFacade as PDFMerger;

class ProjectsController extends Controller
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
            ->when(auth()->user()->hasRole('qc-officer'), function ($q) {
                return $q->whereHas('qc', function ($q) {
                    return $q->where('qc', '=', auth()->user()->id);
                });
            })
            ->when(auth()->user()->hasRole('guest'), function ($q) {
                return $q->where('user_id', '=', auth()->user()->id);
            })
            ->whereIn('stage', [2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12])
            ->get();
        // if (auth()->user()->hasRole('guest')) {
        //     return redirect('requests');
        // }

        return view('projects.index', compact('data'));
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Projects  $projects
     * @return \Illuminate\Http\Response
     */
    public function destroy(Projects $projects)
    {
        //
    }

    public function verify2($id)
    {
        $project = Projects::with('files')->find($id);

        $data = $project->orders->siinas_data;

        return view('projects.verify2', compact('project', 'data'));
    }

    public function draf($id)
    {
        $data = Projects::with('files')->find($id);

        return view('projects.draf', compact('data'));
    }

    public function tkdn($id)
    {
        $project = Projects::with('files')->find($id);

        $data = $project->orders->siinas_data;

        return view('projects.tkdn', compact('project', 'data'));
    }

    public function verifyTkdn($id)
    {
        $project = Projects::with('files')->find($id);

        $data = $project->orders->siinas_data;

        return view('projects.verifyTkdn', compact('project', 'data'));
    }

    public function suratPengantar($id)
    {
        $data = Projects::with('files')->find($id);

        return view('projects.surat-pengantar', compact('data'));
    }

    public function suratJawaban($id)
    {
        $data = Projects::with('files')->find($id);

        return view('projects.surat-jawaban', compact('data'));
    }

    public function view($id)
    {
        $project = Projects::with('files')->find($id);

        $data = $project->orders->siinas_data;

        return view('projects.view', compact('data', 'project'));
    }

    public function lunas($id)
    {
        $data = Projects::with('files')->find($id);

        return view('projects.lunas', compact('data'));
    }

    public function drafSubmit(Request $request, $id)
    {
        DB::beginTransaction();
        try {
            if ($request->action == 1) {
                $project = Projects::with('data', 'files')->find($id);
                $project->stage = 3;
                $project->save();
    
                $endPoint = 'http://api.kemenperin.go.id/tkdn/LVIRecieveTahap3.php';
                $payload = [
                    "tahap" => 3,
                    "verifikator" => "BKI",
                    "no_berkas" => $project->no_berkas,
                ];
    
                $response = Http::post($endPoint, $payload);
    
                $documentReceipt = new DocumentReceipt();
                $documentReceipt->project_id = $project->id;
                $documentReceipt->stage = 3;
                $documentReceipt->end_point = $endPoint;
                $documentReceipt->payload = json_encode($payload);
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
            } else {
                Tkdn::where('project_id', $id)->update([
                    'status' => 0
                ]);
            }
            DB::commit();
            return redirect('projects')->with('success', 'Data Saved Successfully');
        } catch (\Throwable $th) {
            DB::rollBack();
            return redirect('projects')->with('success', $th->getMessage());
        }
    }

    public function verify2Submit(Request $request, $id)
    {
        // foreach ($request->file_name as $k => $files) {
        //     foreach ($files as $key => $value) {
        //         if (isset($request->file('file')[$k][$key])) {
        //             $this->singleUpload(1, $request->file('file')[$k][$key], $request->project_id, Str::headline($k) . '-' . $value, 'project');
        //         }
        //     }
        // }
        DB::beginTransaction();
        try {

            // $hasilVerifikasi = PDFMerger::init();
            // $nilaiTkdn = PDFMerger::init();
            foreach ($request->id_produk as $key => $id_produk) {
                Tkdn::updateOrCreate(
                    [
                        'project_id' => $id,
                        'id_produk' => $id_produk
                    ],
                    [
                        'project_id' => $id,
                        'id_produk' => $id_produk,
                        'nilai_tkdn' => $request->nilai_tkdn[$key],
                        'nilai_tkdn_jasa' => $request->nilai_tkdn_jasa[$key],
                        'nilai_tkdn_gabungan' => $request->nilai_tkdn_gabungan[$key],
                        'status' => $request->status,
                    ]
                );

                $folderPath = public_path('storage/files/project/' . now()->format('dmy') . '_' . $id);
                if (!File::isDirectory($folderPath)) {
                    File::makeDirectory($folderPath, 0777, true, true);
                }

                if (isset($request->hasil_verifikasi[$key])) {
                    $this->singleUpload(1, $request->file('hasil_verifikasi')[$key], $id, Str::headline($key) . '-Draft Laporan Hasil Verifikasi', 'project');
                    // $hasilVerifikasi->addPDF($request->file('hasil_verifikasi')[$key]->getPathName(), 'all');
                }
                if (isset($request->form_nilai_tkdn[$key])) {
                    $this->singleUpload(1, $request->file('form_nilai_tkdn')[$key], $id, Str::headline($key) . '-Draft Form Penghitungan Nilai TKDN', 'project');
                    // $nilaiTkdn->addPDF($request->file('hasil_verifikasi')[$key]->getPathName(), 'all');
                }

                if (isset($request->file_name)) {
                    foreach ($request->file_name as $key => $value) {
                        $this->singleUpload(1, $request->file('file')[$key], $request->project_id, $value, 'project');
                    }
                }
            }
            // $hasilVerifikasi->merge();
            // $nilaiTkdn->merge();

            // $hasilVerifikasi->save('storage/files/merged_hasil_verifikasi.pdf');
            // $nilaiTkdn->save('storage/files/merged_nilai_tkdn.pdf');

            // Upload::updateOrCreate(
            //     [
            //         'request_id' => $id,
            //         'label' => 'Draft Laporan Hasil Verifikasi',
            //     ],
            //     [
            //         'request_id' => $id,
            //         'name' => 'merged_hasil_verifikasi.pdf',
            //         'filename' => 'Draft Laporan Hasil Verifikasi',
            //         'path' => 'public/merged_hasil_verifikasi.pdf',
            //         'label' => 'merger',
            //         'order' => '1',
            //         'tag' => 'merger',
            //         'upload_date' => now()
            //     ]
            // );

            // Upload::updateOrCreate(
            //     [
            //         'request_id' => $id,
            //         'label' => 'Draft Form Penghitungan Nilai TKDN',
            //     ],
            //     [
            //         'request_id' => $id,
            //         'name' => 'merged_nilai_tkdn.pdf',
            //         'filename' => 'Draft Form Penghitungan Nilai TKDN',
            //         'path' => 'public/merged_nilai_tkdn.pdf',
            //         'label' => 'merger',
            //         'order' => '1',
            //         'tag' => 'merger',
            //         'upload_date' => now()
            //     ]
            // );
            $project = Projects::find($id);
            $project->status = 201;
            $project->save();

            // $project->qc->qc_status = null;
            // $project->qc->save();

            $user = User::find($project->qc->qc);
            $admin = User::find(2);

            $details = [
                'from' => auth()->id(),
                'message' => 'No Dokumen ' . $project->no_berkas . ' Telah Input Nilai TKDN',
                'actionURL' => route('projects.index', $request->project_id)
            ];

            $user->notify(new ProjectNotification($details));
            $admin->notify(new ProjectNotification($details));
            DB::commit();

            return redirect('projects')->with('success', 'Data Saved Successfully');
        } catch (\Throwable $th) {
            DB::rollBack();
            return redirect('projects')->with('success', $th->getMessage());
        }
    }

    public function tkdnSubmit(Request $request, $id)
    {
        DB::beginTransaction();
        try {
            $project = Projects::find($id);
            $project->qc->qc_status = $request->action;
            $project->qc->qc_note = $request->note;
            $project->qc->save();
    
            if ($request->action == 1) {
                $project->status_siinas = 1;
                $project->status = 300;
                $project->stage = 3;
                $project->save();
    
                // $project->kepala->kepala_status = null;
                // $project->kepala->save();
    
    
                // $hasilPersetujuan = PDFMerger::init();
                // $hasilVerifikasi = PDFMerger::init();
    
                foreach ($request->id_produk as $key => $id_produk) {
                    $folderPath = public_path('storage/files/project/' . now()->format('dmy') . '_' . $id);
                    if (!File::isDirectory($folderPath)) {
                        File::makeDirectory($folderPath, 0777, true, true);
                    }
    
                    if (isset($request->hasil_persetujuan[$key])) {
                        $this->singleUpload(1, $request->file('hasil_persetujuan')[$key], $id, Str::headline($key) . '-Draf Hasil Persetujuan Penamaan Tanda Sah', 'project');
                        // $hasilPersetujuan->addPDF($request->file('hasil_persetujuan')[$key]->getPathName(), 'all');
                    }
                    if (isset($request->laporan_hasil_verifikasi[$key])) {
                        $this->singleUpload(1, $request->file('laporan_hasil_verifikasi')[$key], $id, Str::headline($key) . '-Laporan Hasil Verifikasi', 'project');
                        // $hasilVerifikasi->addPDF($request->file('laporan_hasil_verifikasi')[$key]->getPathName(), 'all');
                    }
    
                    if (isset($request->form_perhitungan_nilai_tkdn[$key])) {
                        $this->singleUpload(1, $request->file('form_perhitungan_nilai_tkdn')[$key], $id, Str::headline($key) . '-Form Perhitungan Nilai TKDN', 'project');
                    }
    
                    // if (isset($request->file_name)) {
                    //     foreach ($request->file_name as $key => $value) {
                    //         $this->singleUpload(1, $request->file('file')[$key], $request->project_id, $value, 'project');
                    //     }
                    // }
                }
                // $hasilVerifikasi->merge();
                // $hasilPersetujuan->merge();
    
                // $hasilVerifikasi->save('storage/files/laporan_hasil_verifikasi.pdf');
                // $hasilPersetujuan->save('storage/files/hasil_persetujuan.pdf');
    
                // Upload::updateOrCreate(
                //     [
                //         'request_id' => $id,
                //         'label' => 'Draf Hasil Persetujuan Penamaan Tanda Sah',
                //     ],
                //     [
                //         'request_id' => $id,
                //         'name' => 'laporan_hasil_verifikasi.pdf',
                //         'filename' => 'Draf Hasil Persetujuan Penamaan Tanda Sah',
                //         'path' => 'public/laporan_hasil_verifikasi.pdf',
                //         'label' => 'merger',
                //         'order' => '1',
                //         'tag' => 'merger',
                //         'upload_date' => now()
                //     ]
                // );
    
                // Upload::updateOrCreate(
                //     [
                //         'request_id' => $id,
                //         'label' => 'Laporan Hasil Verifikasi',
                //     ],
                //     [
                //         'request_id' => $id,
                //         'name' => 'hasil_persetujuan.pdf',
                //         'filename' => 'Laporan Hasil Verifikasi',
                //         'path' => 'public/hasil_persetujuan.pdf',
                //         'label' => 'merger',
                //         'order' => '1',
                //         'tag' => 'merger',
                //         'upload_date' => now()
                //     ]
                // );
    
                $endPoint = 'http://api.kemenperin.go.id/tkdn/LVIRecieveTahap3.php';
                $payload = [
                    "tahap" => 3,
                    "verifikator" => "BKI",
                    "no_berkas" => $project->no_berkas,
                ];
    
                $response = Http::post($endPoint, $payload);
    
                $documentReceipt = new DocumentReceipt();
                $documentReceipt->project_id = $project->id;
                $documentReceipt->stage = 3;
                $documentReceipt->end_point = $endPoint;
                $documentReceipt->payload = json_encode($payload);
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
                $user = User::find(4);
                $admin = User::find(2);
    
                $details = [
                    'from' => auth()->id(),
                    'message' => 'Review No Dokumen ' . $project->no_berkas,
                    'actionURL' => route('projects.index', $request->project_id)
                ];
    
                $user->notify(new ProjectNotification($details));
                $admin->notify(new ProjectNotification($details));
            } else {
                $project->status = 200;
                $project->save();
    
                $asesor = User::find($project->asesors->whereIn('asesor_status', [1, 3])->first()->asesor);
    
                $details = [
                    'from' => auth()->id(),
                    'message' => 'Draft TKDN ' . $project->no_berkas . ' ditolak',
                    'actionURL' => route('projects.index', $request->project_id)
                ];
    
                $asesor->notify(new ProjectNotification($details));
            }
    
            DB::commit();
            return redirect('projects')->with('success', 'Data Saved Successfully');
        } catch (\Throwable $th) {
            DB::rollBack();
            return redirect('projects')->with('success', $th->getMessage());
        }
    }

    public function verifyTkdnSubmit(Request $request, $id)
    {
        DB::beginTransaction();
        try {
            if (auth()->user()->hasRole('administrator')) {
                $project = Projects::with('data', 'files', 'additional')->find($id);
                $project->status = 400;
                $project->stage = 4;
                $project->save();

                $produk = [];
                $kbli = '';
                foreach ($project->orders->siinas_data->produk as $value) {
                    $produksi = collect($project->orders->siinas_data->produksi)->firstWhere('produk', $project->tkdn->firstWhere('id_produk', $value->id_produk)->status ?? $value->produk);

                    $additional = $project->additional->firstWhere('id_produk', $value->id_produk);
                    $tkdn = $project->tkdn->where('id_produk', $value->id_produk)->firstWhere('project_id', $project->id);
                    $kbli = $produksi->kbli;
                    $path = Upload::where('request_id', $project->id)->where('tag', 'foto')->where('label','ilike', $value->produk.'%')->first()->path ?? '';
                    array_push($produk, [
                        "id_produk" => $value->id_produk,
                        "produk" => $value->produk,
                        "spesifikasi" => $produksi->spesifikasi,
                        "kd_hs" => $produksi->kd_hs,
                        "kd_kelompok_barang" => $additional->kd_kelompok_barang ?? '-',
                        "nilai_tkdn" => $tkdn->nilai_tkdn,
                        "nilai_tkdn_jasa" => $tkdn->nilai_tkdn_jasa,
                        "nilai_tkdn_gabungan" => $tkdn->nilai_tkdn_gabungan,
                        "merk" =>  $additional->merk ?? '-',
                        "tipe" =>  $additional->tipe ?? '-',
                        "standar" =>  $additional->standar ?? '-',
                        "sertifikat_produk" =>  $additional->sertifikat_produk ?? '-',
                        "produsen" =>  $additional->produsen ?? '-',
                        "foto_produk" => $path ? asset('storage/' . $path) : '-'
                    ]);
                }

                $path = Upload::where('request_id', $project->id)->where('label', 'ilike', '%-Draf Hasil Persetujuan Penamaan Tanda Sah')->first()->path ?? '';

                $endPoint = 'http://api.kemenperin.go.id/tkdn/LVIRecieveTahap4.php';
                $payload = [
                    "tahap" => "4",
                    "verifikator" => "BKI",
                    "no_berkas" => $project->no_berkas,
                    "url_draft_persetujuan_penamaan_tanda_sah" => $path ? asset('storage/' . $path) : '-',
                    "no_referensi" => $project->no_referensi, // dari Assessor
                    "no_laporan" => $project->no_laporan, // dari Assessor
                    "kbli" => $kbli, // dari Assessor
                    "bidang_usaha" => $project->bidang_usaha, // dari Assessor
                    "produk" => $produk
                ];

                $response = Http::post($endPoint, $payload);

                $documentReceipt = new DocumentReceipt();
                $documentReceipt->project_id = $project->id;
                $documentReceipt->stage = 4;
                $documentReceipt->end_point = $endPoint;
                $documentReceipt->payload = json_encode($payload);
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
            } else {
                $project = Projects::with('data')->find($id);
                $project->kepala->kepala_status = $request->action;

                $project->kepala->save();
                if ($request->action == 1) {
                    $project->status = 301;
                    $project->save();

                    $admin = User::find(2);

                    $details = [
                        'from' => auth()->id(),
                        'message' => 'Menyetujui No Dokumen ' . $project->no_berkas,
                        'actionURL' => route('projects.index', $request->project_id)
                    ];

                    $admin->notify(new ProjectNotification($details));
                } else {
                    $project->status = 201;
                    $project->save();
                    $user = User::find($project->qc->qc);

                    $details = [
                        'from' => auth()->id(),
                        'message' => 'Menolak No Dokumen ' . $project->no_berkas,
                        'actionURL' => route('projects.index', $request->project_id)
                    ];

                    $user->notify(new ProjectNotification($details));
                }
            }

            DB::commit();
            return redirect('projects')->with('success', 'Data Saved Successfully');
        } catch (\Throwable $th) {
            DB::rollBack();
            return redirect('projects')->with('success', $th->getMessage());
        }
    }

    public function suratPengantarSubmit(Request $request, $id)
    {
        DB::beginTransaction();
        try {
            $folderPath = public_path('storage/files/project/' . now()->format('dmy') . '_' . $id);
            if (!File::isDirectory($folderPath)) {
                File::makeDirectory($folderPath, 0777, true, true);
            }
    
            if (isset($request->surat_pengantar)) {
                $this->singleUpload(1, $request->file('surat_pengantar'), $id, 'Surat Pengantar Permohonan Jadwal Review', 'internal');
            }
    
            $project = Projects::with('data', 'files')->find($id);
            $project->status = 600;
            $project->stage = 6;
            $project->save();
    
            // $path = $project->internal_files?->where('label', 'Surat Pengantar Permohonan Jadwal Review')?->first()->path ?? '';
            $path = Upload::where('request_id', $project->id)->where('label', 'ilike', '%Surat Pengantar Permohonan Jadwal Review')->first()->path ?? '';
            $lhv = Upload::where('request_id', $project->id)->where('label', 'ilike', '%Laporan Hasil Verifikasi')->first()->path ?? '';
            $endPoint = 'http://api.kemenperin.go.id/tkdn/LVIRecieveTahap6.php';
            $payload = [
                "tahap" => "6",
                "verifikator" => "BKI",
                "no_berkas" => $project->no_berkas,
                "url_surat_pengantar" => $path ? asset('storage/' . $path) : '-',
                "url_lhv_ttd" => $lhv ? asset('storage/' . $lhv) : '-', // url file laporan hasil verifikasi
                "nama_asesor" => $project->asesors->whereIn('asesor_status', [1, 3])->first()->user->name // Ambil dari assessor
            ];
    
            $response = Http::post($endPoint, $payload);
    
            $documentReceipt = new DocumentReceipt();
            $documentReceipt->project_id = $project->id;
            $documentReceipt->stage = 6;
            $documentReceipt->end_point = $endPoint;
            $documentReceipt->payload = json_encode($payload);
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
            DB::commit();
            return redirect('projects')->with('success', 'Data Saved Successfully');
        } catch (\Throwable $th) {
            DB::rollBack();
            return redirect('projects')->with('success', $th->getMessage());
        }
    }

    public function suratJawabanSubmit(Request $request, $id)
    {
        DB::beginTransaction();
        try {
            $folderPath = public_path('storage/files/project/' . now()->format('dmy') . '_' . $id);
            if (!File::isDirectory($folderPath)) {
                File::makeDirectory($folderPath, 0777, true, true);
            }

            if (isset($request->surat_jawaban)) {
                $this->singleUpload(1, $request->file('surat_jawaban'), $id, 'Surat Jawaban', 'internal');
            }
            if (isset($request->surat_penyesuaian)) {
                $this->singleUpload(1, $request->file('surat_penyesuaian'), $id, 'Surat Penyesuaian', 'internal');
            }
            if (isset($request->surat_pendukung)) {
                foreach ($request->surat_pendukung as $key => $value) {
                    $this->singleUpload(1, $request->file('surat_pendukung')[$key], $id, 'Surat Pendukung-' . $key, 'internal');
                }
            }

            $project = Projects::with('data', 'files', 'tkdn')->find($id);
            $project->status = 1100;
            $project->stage = 10;
            $project->save();

            $produk = [];
            $kbli = '';
            foreach ($project->orders->siinas_data->produk as $value) {
                $produksi = collect($project->orders->siinas_data->produksi)->firstWhere('produk', $project->tkdn->firstWhere('id_produk', $value->id_produk)->status ?? $value->produk);

                $additional = $project->additional->firstWhere('id_produk', $value->id_produk);
                $tkdn = $project->tkdn->where('id_produk', $value->id_produk)->firstWhere('project_id', $project->id);
                $kbli = $produksi->kbli;
                $path = Upload::where('request_id', $project->id)->where('tag', 'foto')->where('label', 'ilike', $value->produk . '%')->first()->path ?? '';
                array_push($produk, [
                    "id_produk" => $value->id_produk,
                    "produk" => $value->produk,
                    "spesifikasi" => $produksi->spesifikasi,
                    "kd_hs" => $produksi->kd_hs,
                    "kd_kelompok_barang" => $additional->kd_kelompok_barang ?? '-',
                    "nilai_tkdn" => $tkdn->nilai_tkdn,
                    "nilai_tkdn_jasa" => $tkdn->nilai_tkdn_jasa,
                    "nilai_tkdn_gabungan" => $tkdn->nilai_tkdn_gabungan,
                    "merk" =>  $additional->merk ?? '-',
                    "tipe" =>  $additional->tipe ?? '-',
                    "standar" =>  $additional->standar ?? '-',
                    "sertifikat_produk" =>  $additional->sertifikat_produk ?? '-',
                    "produsen" =>  $additional->produsen ?? '-',
                    "foto_produk" => $path ? asset('storage/' . $path) : '-'
                ]);
            }

            // $pathSuratJawaban = $project->internal_files?->where('label', 'Surat Jawaban')?->first()->path ?? '';
            // $pathSuratPenyesuaian = $project->internal_files?->where('label', 'Surat Penyesuaian')?->first()->path ?? '';
            // $pathSuratPendukung = $project->internal_files?->where('label', 'Surat Pendukung')?->first()->path ?? '';
            $pathSuratJawaban = Upload::where('request_id', $project->id)->where('label', 'ilike', '%Surat Jawaban')->first()->path ?? '';
            $pathSuratPenyesuaian = Upload::where('request_id', $project->id)->where('label', 'ilike', '%Surat Penyesuaian')->first()->path ?? '';
            $pathSuratPendukung = Upload::where('request_id', $project->id)->where('label', 'ilike', '%Surat Pendukung%')->pluck('path') ?? [];

            $url_dok_dukung = [];
            foreach ($pathSuratPendukung as $key => $value) {
                array_push($url_dok_dukung, ['url' => $value ? asset('storage/' . $value) : '-']);
            }

            $endPoint = 'http://api.kemenperin.go.id/tkdn/LVIRecieveTahap10.php';
            $payload = [
                "tahap" => "10",
                "verifikator" => "BKI",
                "no_berkas" => $project->no_berkas,
                "status" => "1",
                "alasan" => $request->note, // Alasan dari input
                "no_referensi" => $project->no_referensi, // // dari submit tahap 4
                "no_laporan" => $project->no_laporan, // // dari submit tahap 4
                "url_surat_jawaban" => $pathSuratJawaban ? asset('storage/' . $pathSuratJawaban) : '-',
                "url_lhv_penyesuaian" =>  $pathSuratPenyesuaian ? asset('storage/' . $pathSuratPenyesuaian) : '-',
                "url_dok_dukung" => $url_dok_dukung,
                "kbli" => $kbli, // dari produk
                "bidang_usaha" => $project->bidang_usaha, // dari submit tahap 4
                "produk" => $produk
            ];

            $response = Http::post($endPoint, $payload);

            $documentReceipt = new DocumentReceipt();
            $documentReceipt->project_id = $project->id;
            $documentReceipt->stage = 10;
            $documentReceipt->end_point = $endPoint;
            $documentReceipt->payload = json_encode($payload);
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

            DB::commit();
            return redirect('projects')->with('success', 'Data Saved Successfully');
        } catch (\Throwable $th) {
            DB::rollBack();
            return redirect('projects')->with('success', $th->getMessage());
        }
    }

    public function lunasSubmit(Request $request, $id)
    {
        DB::beginTransaction();
        try {
            $project = Projects::with('data', 'files', 'tkdn')->find($id);
            $project->status = 1210;
            $project->stage = 12;
            $project->save();

            $project->ProjectMeta->tgl_pelunasan = $request->tgl_pelunasan;
            $project->ProjectMeta->save();

            $endPoint = 'http://api.kemenperin.go.id/tkdn/LVIRecieveTahap12.php';
            $payload = [
                "tahap" => "12",
                "verifikator" => "BKI",
                "no_berkas" => $project->no_berkas,
                "status" => "1",
                "lunas" => "1",
                "tgl_pelunasan" => $request->tgl_pelunasan,
            ];

            $response = Http::post($endPoint, $payload);

            $documentReceipt = new DocumentReceipt();
            $documentReceipt->project_id = $project->id;
            $documentReceipt->stage = 10;
            $documentReceipt->end_point = $endPoint;
            $documentReceipt->payload = json_encode($payload);
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

            DB::commit();
            return redirect('projects')->with('success', 'Data Saved Successfully');
        } catch (\Throwable $th) {
            DB::rollBack();
            return redirect('projects')->with('success', $th->getMessage());
        }
    }

    public function detail($id)
    {
        // $project = Projects::with('orders')->find($id);
        $project = Projects::with('files')->find($id);

        $data = $project->orders->siinas_data;

        return view('projects.detail', compact('project', 'data'));

        // return view('projects.detail', compact('data'));
    }

    public function jsonToDebug($jsonText = '')
    {
        $arr = json_decode($jsonText, true);
        $html = "";
        if ($arr && is_array($arr)) {
            $html .= $this->_arrayToHtmlTableRecursive($arr);
        }
        return $html;
    }

    private function _arrayToHtmlTableRecursive($arr)
    {
        $str = "<table class='table'><tbody>";
        foreach ($arr as $key => $val) {
            $str .= "<tr>";
            $str .= "<td>" . Str::headline($key) . "</td>";
            $str .= "<td>";
            if (is_array($val)) {
                if (!empty($val)) {
                    $str .= self::_arrayToHtmlTableRecursive($val);
                }
            } else {
                $str .= "<strong>$val</strong>";
            }
            $str .= "</td></tr>";
        }
        $str .= "</tbody></table>";

        return $str;
    }
}
