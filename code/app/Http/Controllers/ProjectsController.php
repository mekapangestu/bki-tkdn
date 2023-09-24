<?php

namespace App\Http\Controllers;

use App\Models\Asesors;
use App\Models\ProjectAdditional;
use App\Models\User;
use App\Models\Projects;
use Illuminate\Http\Request;
use App\Traits\Util;
use Illuminate\Support\Facades\File;

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

    public function submit(Request $request, $id, $status)
    {
        $asesor = Projects::find($id);
        $asesor->status = $status;

        $asesor->save();

        return back()->with('success', 'Data Saved Successfully');
    }
}
