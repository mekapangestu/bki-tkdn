<?php

namespace App\Http\Controllers;

use App\Models\Statuses;
use Illuminate\Http\Request;

class StatusController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $data = Statuses::all();

        $title = "Status";

        return view('status', compact('data', 'title'));
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
        $whitelist = new Statuses();
        $whitelist->name = $request->name;
        $whitelist->save();

        return back()->with('success', 'Data Saved Successfully');
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\WhitelistIp  $whitelistip
     * @return \Illuminate\Http\Response
     */
    public function show(WhitelistIp $whitelistip)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\WhitelistIp  $whitelistip
     * @return \Illuminate\Http\Response
     */
    public function edit(WhitelistIp $whitelistip)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $requestTkdn
     * @param  \App\Models\WhitelistIp  $whitelistip
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $whitelistip = Statuses::find($id);
        $whitelistip->name = $request->name;
        $whitelistip->save();

        return back()->with('success', 'Data Saved Successfully');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\WhitelistIp  $whitelistip
     * @return \Illuminate\Http\Response
     */
    public function destroy(WhitelistIp $whitelistip)
    {
        //
    }
}
