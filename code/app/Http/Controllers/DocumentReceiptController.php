<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\DocumentReceipt;
use Illuminate\Support\Facades\Http;

class DocumentReceiptController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $data = DocumentReceipt::with('project')->orderByDesc('created_at')->get();

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

    public function rePost($id)
    {
        $data = DocumentReceipt::find($id);

        $response = Http::post($data->end_point, (array) json_decode($data->payload));

        $documentReceipt = new DocumentReceipt();
        $documentReceipt->project_id = $data->project_id;
        $documentReceipt->stage = 2;
        $documentReceipt->payload = $data->payload;
        $documentReceipt->end_point = $data->end_point;
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

        return back()->with('success', 'Data Repost Successfully');
    }
}
