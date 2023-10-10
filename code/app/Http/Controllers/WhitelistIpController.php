<?php

namespace App\Http\Controllers;

use App\Models\WhitelistIp;
use Illuminate\Http\Request;

class WhitelistIpController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $data = WhitelistIp::all();

        return view('whitelist_ip', compact('data'));
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
        $whitelist = new WhitelistIp();
        $whitelist->ip = $request->ip;
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
        $whitelistip = WhitelistIp::find($id);
        $whitelistip->status = !$whitelistip->status;
        $whitelistip->save();

        return redirect('whitelist-ip')->with('success', 'Data Saved Successfully');
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
