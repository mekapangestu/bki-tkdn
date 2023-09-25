<?php

namespace App\Http\Controllers;

use App\Models\DocumentReceipt;
use Illuminate\Http\Request;

class DocumentReceiptController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $data = DocumentReceipt::with('project')->orderBydesc('created_at')->get();

        return view('logs-siinas', compact('data'));
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
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\DocumentReceipt  $documentReceipt
     * @return \Illuminate\Http\Response
     */
    public function show(DocumentReceipt $documentReceipt)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\DocumentReceipt  $documentReceipt
     * @return \Illuminate\Http\Response
     */
    public function edit(DocumentReceipt $documentReceipt)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\DocumentReceipt  $documentReceipt
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, DocumentReceipt $documentReceipt)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\DocumentReceipt  $documentReceipt
     * @return \Illuminate\Http\Response
     */
    public function destroy(DocumentReceipt $documentReceipt)
    {
        //
    }
}
