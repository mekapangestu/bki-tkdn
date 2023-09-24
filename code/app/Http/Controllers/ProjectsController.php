<?php

namespace App\Http\Controllers;

use App\Models\User;
use App\Traits\Util;
use App\Models\Asesors;
use App\Models\Projects;
use Illuminate\Http\Request;
use App\Models\DocumentReceipt;
use App\Models\ProjectAdditional;
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
        //
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

            if (isset($request->nib)) {
                $this->singleUpload(1, $request->file('nib'), $request->project_id, 'NIB', 'project');
            }

            if (isset($request->izin_usaha_industri)) {
                $this->singleUpload(2, $request->file('izin_usaha_industri'), $request->project_id, 'Izin Usaha Industri', 'project');
            }

            if (isset($request->akta_perusahaan)) {
                $this->singleUpload(3, $request->file('akta_perusahaan'), $request->project_id, 'Akta Perusahaan', 'project');
            }

            if (isset($request->npwp)) {
                $this->singleUpload(4, $request->file('npwp'), $request->project_id, 'NPWP', 'project');
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
        $data = Projects::with('files')->find($id);

        return view('projects.verify2', compact('data'));
    }

    public function draf($id)
    {
        $data = Projects::with('files')->find($id);

        return view('projects.draf', compact('data'));
    }

    public function verifySubmit(Request $request, $id)
    {
        $asesor = Asesors::find($id);
        $asesor->asesor_status = $request->action;
        $asesor->asesor_note = $request->note;

        $asesor->save();
        
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
        $asesor = Asesors::find($id);
        $asesor->asesor_status = 5;

        $asesor->save();

        $folderPath = public_path('storage/files/project/' . now()->format('dmy') . '_' . $id);
        if (!File::isDirectory($folderPath)) {
            File::makeDirectory($folderPath, 0777, true, true);
        }

        if (isset($request->hasil_verifikasi)) {
            $this->singleUpload(1, $request->file('hasil_verifikasi'), $id, 'Draft Laporan Hasil Verifikasi', 'project');
        }
        if (isset($request->nilai_tkdn)) {
            $this->singleUpload(1, $request->file('nilai_tkdn'), $id, 'Draft Form Penghitungan Nilai TKDN', 'project');
        }

        return back()->with('success', 'Data Saved Successfully');
    }

    public function submit(Request $request, $id, $status)
    {
        $project = Projects::with('data', 'files')->find($id);
        $project->status = $status;

        $project->save();
        
        $path = $project->files?->where('label', 'SPTJM')?->first()->path ?? '';
        $response = Http::post('http://api.kemenperin.go.id/tkdn/LVIRecieveTahap2.php', [
            "tahap" => 2,
            "verifikator" => "BKI",
            "no_berkas" => $project->no_berkas,
            "status" => $status == 3 ? 0 : ($status == 4 ? 3 : ''),
            "alasan_tolak" => $status == 4 ? $project->data->asesor_note : '',
            "url_sptjm" => $path ? asset('storage/'. $path) : '',
            "tgl_bast" => $path ? now() : '',
        ]);

        $documentReceipt = new DocumentReceipt();
        $documentReceipt->project_id = $project->id;
        $documentReceipt->stage = 2;
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

    public function drafSubmit(Request $request, $id, $status)
    {
        $project = Projects::with('data', 'files')->find($id);
        
        $path = $project->files?->where('label', 'SPTJM')?->first()->path ?? '';
        $response = Http::post('http://api.kemenperin.go.id/tkdn/LVIRecieveTahap3.php', [
            "tahap" => 2,
            "verifikator" => "BKI",
            "no_berkas" => $project->no_berkas,
        ]);

        $documentReceipt = new DocumentReceipt();
        $documentReceipt->project_id = $project->id;
        $documentReceipt->stage = 3;
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
}
