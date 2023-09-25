<?php

namespace App\Http\Controllers;

use App\Models\User;
use App\Traits\Util;
use App\Models\Asesors;
use App\Models\Projects;
use Illuminate\Http\Request;
use App\Models\DocumentReceipt;
use App\Models\Orders;
use App\Models\ProjectAdditional;
use App\Models\Tkdn;
use Illuminate\Support\Facades\File;
use Illuminate\Support\Facades\Http;

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
        $data = Projects::with('statuses')
                ->when(auth()->user()->hasRole('assessor'), function ($q) {
                    return $q->whereHas('data', function ($q) {
                        return $q->where('asesor', '=', auth()->user()->id);
                    });
                })
                ->when(auth()->user()->hasRole('qc-officer'), function ($q) {
                    return $q->whereHas('data', function ($q) {
                        return $q->where('qc', '=', auth()->user()->id);
                    });
                })
                ->get();
        
        return view('project', compact('data'));
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
        try {            
            $folderPath = public_path('storage/files/project/' . now()->format('dmy') . '_' . $request->project_id);
            if (!File::isDirectory($folderPath)) {
                File::makeDirectory($folderPath, 0777, true, true);
            }

            if (isset($request->aspek_produksi)) {
                $this->singleUpload(1, $request->file('aspek_produksi'), $request->project_id, 'Aspek Produksi', 'project');
            }

            if (isset($request->aspek_pemasaran)) {
                $this->singleUpload(2, $request->file('aspek_pemasaran'), $request->project_id, 'Aspek Pemasaran', 'project');
            }

            if (isset($request->perhitungan_tkdn)) {
                $this->singleUpload(3, $request->file('perhitungan_tkdn'), $request->project_id, 'Perhitungan TKDN Pemohon', 'project');
            }

            if (isset($request->dokumen_lainnya)) {
                $this->singleUpload(4, $request->file('dokumen_lainnya'), $request->project_id, 'Dokumen Lainnya', 'project');
            }

            return back()->with('success', 'Data Saved Successfully');
        } catch (\Exception $e) {
            return back()->with('error', $e->getMessage());
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Projects  $projects
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $data = Projects::find($id);
        $user = User::all();
        
        return view('projects.index', compact('data', 'user'));
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Projects  $projects
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $data = Projects::find($id);

        return view('projects.edit', compact('data'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Projects  $projects
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $asesor = new Asesors();
        $asesor->project_id = $request->project_id;
        $asesor->asesor = $request->asesor;
        $asesor->qc = $request->qc;

        $asesor->save();

        return back()->with('success', 'Data Saved Successfully');
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

    public function verify($id)
    {
        $data = Projects::with('files')->find($id);

        return view('projects.verify', compact('data'));
    }

    public function verify2($id)
    {
        $data = Projects::with('files', 'tkdn')->find($id);

        return view('projects.verify2', compact('data'));
    }

    public function draf($id)
    {
        $data = Projects::with('files')->find($id);

        return view('projects.draf', compact('data'));
    }

    public function tkdn($id)
    {
        $data = Projects::with('files')->find($id);

        return view('projects.tkdn', compact('data'));
    }

    public function verifyTkdn ($id)
    {
        $data = Projects::with('files')->find($id);

        return view('projects.verifyTkdn', compact('data'));
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
        $data = Projects::with('files')->find($id);

        return view('projects.view', compact('data'));
    }

    public function verifySubmit(Request $request, $id)
    {
        $asesor = Projects::with('data')->find($id);
        $asesor->data->asesor_status = $request->action;
        $asesor->data->asesor_note = $request->note;
        
        $asesor->data->save();
        
        $folderPath = public_path('storage/files/project/' . now()->format('dmy') . '_' . $id);
        if (!File::isDirectory($folderPath)) {
            File::makeDirectory($folderPath, 0777, true, true);
        }

        if (isset($request->bast)) {
            $this->singleUpload(1, $request->file('bast'), $id, 'BAST', 'project');
        }
        if (isset($request->sptjm)) {
            $this->singleUpload(1, $request->file('sptjm'), $id, 'SPTJM', 'project');
        }

        return back()->with('success', 'Data Saved Successfully');
    }

    public function verify2Submit(Request $request, $id)
    {
        $tkdn = Tkdn::updateOrCreate(
            ['project_id' => $id],
            [
                'project_id' => $id,
                'nilai_tkdn' => $request->nilai_tkdn,
                'nilai_tkdn_jasa' => $request->nilai_tkdn_jasa,
                'nilai_tkdn_gabungan' => $request->nilai_tkdn_gabungan,
            ]
        );

        $folderPath = public_path('storage/files/project/' . now()->format('dmy') . '_' . $id);
        if (!File::isDirectory($folderPath)) {
            File::makeDirectory($folderPath, 0777, true, true);
        }

        if (isset($request->hasil_verifikasi)) {
            $this->singleUpload(1, $request->file('hasil_verifikasi'), $id, 'Draft Laporan Hasil Verifikasi', 'project');
        }
        if (isset($request->form_nilai_tkdn)) {
            $this->singleUpload(1, $request->file('form_nilai_tkdn'), $id, 'Draft Form Penghitungan Nilai TKDN', 'project');
        }

        return back()->with('success', 'Data Saved Successfully');
    }

    public function submit(Request $request, $id, $status)
    {
        $project = Projects::with('data', 'files')->find($id);
        $project->status = $status;
        $project->stage = 2;

        $project->save();
        
        $path = $project->files?->where('label', 'SPTJM')?->first()->path ?? '';

        $endPoint = 'http://api.kemenperin.go.id/tkdn/LVIRecieveTahap2.php';
        $payload = [
            "tahap" => 2,
            "verifikator" => "BKI",
            "no_berkas" => $project->no_berkas,
            "status" => $status,
            "alasan_tolak" => $status == 3 ? $project->data->asesor_note : '',
            "url_sptjm" => $path ? asset('storage/' . $path) : '',
            "tgl_bast" => $path ? now() : '',
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

        return back()->with('success', 'Data Saved Successfully');
    }

    public function drafSubmit(Request $request, $id)
    {
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

        return back()->with('success', 'Data Saved Successfully');
    }

    public function tkdnSubmit(Request $request, $id)
    {
        $asesor = Projects::with('data')->find($id);
        $asesor->data->qc_status = $request->action;
        $asesor->data->qc_note = $request->note;
        $asesor->data->save();

        // $asesor->stage = 2;
        // $asesor->save();

        $folderPath = public_path('storage/files/project/' . now()->format('dmy') . '_' . $id);
        if (!File::isDirectory($folderPath)) {
            File::makeDirectory($folderPath, 0777, true, true);
        }

        if (isset($request->hasil_persetujuan)) {
            $this->singleUpload(1, $request->file('hasil_persetujuan'), $id, 'Draf Hasil Persetujuan Penamaan Tanda Sah', 'project');
        }

        return back()->with('success', 'Data Saved Successfully');
    }

    public function verifyTkdnSubmit(Request $request, $id)
    {
        if (auth()->user()->hasRole('administrator')) {
            $project = Projects::with('data', 'files')->find($id);
            $project->stage = 4;
            $project->save();
    
            $path = $project->files?->where('label', 'Draf Hasil Persetujuan Penamaan Tanda Sah')?->first()->path ?? '';
            $endPoint = 'http://api.kemenperin.go.id/tkdn/LVIRecieveTahap4.php';
            $payload = [
                "tahap" => "4",
                "verifikator" => "BKI",
                "no_berkas" => $project->no_berkas,
                "url_draft_persetujuan_penamaan_tanda_sah" => $path ?? "http:\/\/116.206.198.97\/tanda_sah.pdf",
                "no_referensi" => "123\/REF\/2023",
                "no_laporan" => "123\/AWK\/2023",
                "produk" => [
                    "id_produk" => "3",
                    "produk" => "bubur bayi",
                    "spesifikasi" => "spesifikasi bubur",
                    "kbli" => "10130",
                    "kd_hs" => "07096010",
                    "kd_kelompok_barang" => "1",
                    "nilai_tkdn" => $request->tkdn,
                    "nilai_tkdn_jasa" => $request->nilai_tkdn_jasa,
                    "nilai_tkdn_gabungan" => $request->nilai_tkdn_gabungan,
                    "merk" => "bubur",
                    "tipe" => "bubut",
                    "standar" => "bubur",
                    "sertifikat_produk" => "123\/CERT\/2023",
                    "produsen" => "Nama Produsen"
                ]
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
        }else{
            $asesor = Projects::with('data')->find($id);
            $asesor->data->kepala_status = 1;

            $asesor->data->save();
        }


        return back()->with('success', 'Data Saved Successfully');
    }

    public function suratPengantarSubmit(Request $request, $id)
    {
        $folderPath = public_path('storage/files/project/' . now()->format('dmy') . '_' . $id);
        if (!File::isDirectory($folderPath)) {
            File::makeDirectory($folderPath, 0777, true, true);
        }

        if (isset($request->surat_pengantar)) {
            $this->singleUpload(1, $request->file('surat_pengantar'), $id, 'Surat Pengantar Permohonan Jadwal Review', 'project');
        }

        $project = Projects::with('data', 'files')->find($id);
        $project->stage = 6;
        $project->save();
        
        $path = $project->files?->where('label', 'Surat Pengantar Permohonan Jadwal Review')?->first()->path ?? '';
        $endPoint = 'http://api.kemenperin.go.id/tkdn/LVIRecieveTahap6.php';
        $payload = [
            "tahap" => "6",
            "verifikator" => "BKI",
            "no_berkas" => $project->no_berkas,
            "url_surat_pengantar" => $path ?? "http:\/\/116.206.198.97\/surat_pengantar.pdf",
            "url_lhv_ttd" => "http:\/\/116.206.198.97\/lhv_ttd.pdf",
            "nama_asesor" => "Budi"
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

        return back()->with('success', 'Data Saved Successfully');
    }

    public function suratJawabanSubmit(Request $request, $id)
    {
        
        $folderPath = public_path('storage/files/project/' . now()->format('dmy') . '_' . $id);
        if (!File::isDirectory($folderPath)) {
            File::makeDirectory($folderPath, 0777, true, true);
        }
        
        if (isset($request->surat_jawaban)) {
            $this->singleUpload(1, $request->file('surat_jawaban'), $id, 'Surat Jawaban', 'project');
        }
        if (isset($request->surat_penyesuaian)) {
            $this->singleUpload(1, $request->file('surat_penyesuaian'), $id, 'Surat Penyesuaian', 'project');
        }
        if (isset($request->surat_pendukung)) {
            $this->singleUpload(1, $request->file('surat_pendukung'), $id, 'Surat Pendukung', 'project');
        }

        $project = Projects::with('data', 'files', 'tkdn')->find($id);
        $project->stage = 10;
        $project->save();

        $path = $project->files?->where('label', 'Surat Pengantar Permohonan Jadwal Review')?->first()->path ?? '';
        $endPoint = 'http://api.kemenperin.go.id/tkdn/LVIRecieveTahap10.php';
        $payload = [
            "tahap" => "10",
            "verifikator" => "BKI",
            "no_berkas" => $project->no_berkas,
            "status" => '1',
            "alasan" => '',
            "no_referensi" => "123\/REF\/2023",
            "no_laporan" => "123\/AWK\/2023",
            "url_surat_jawaban" => $path ?? "http:\/\/116.206.198.97\/tanda_sah.pdf",
            "url_lhv_penyesuaian" => $path ?? "http:\/\/116.206.198.97\/tanda_sah.pdf",
            "url_dok_dukung" => [
                "url" => $path ?? "http:\/\/116.206.198.97\/tanda_sah.pdf"
            ],
            "produk" => [
                "id_produk" => "3",
                "produk" => "bubur bayi",
                "spesifikasi" => "spesifikasi bubur",
                "kbli" => "10130",
                "kd_hs" => "07096010",
                "kd_kelompok_barang" => "1",
                "nilai_tkdn" => $project->tkdn->nilai_tkdn,
                "nilai_tkdn_jasa" => $project->nilai_tkdn_jasa,
                "nilai_tkdn_gabungan" => $project->nilai_tkdn_gabungan,
                "merk" => "bubur",
                "tipe" => "bubut",
                "standar" => "bubur",
                "sertifikat_produk" => "123\/CERT\/2023",
                "produsen" => "Nama Produsen"
            ]
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

        return back()->with('success', 'Data Saved Successfully');
    }

    public function detail($id){
        $project = Projects::with('orders')->find($id);

        $data = $this->jsonToDebug($project->orders->siinas_data);

        return view('projects.detail', compact('data'));
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
            $str .= "<td>$key</td>";
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
