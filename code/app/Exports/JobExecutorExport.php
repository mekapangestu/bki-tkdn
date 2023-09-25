<?php

namespace App\Exports;

use App\Models\JobExecutor;
use Maatwebsite\Excel\Concerns\FromCollection;
use Maatwebsite\Excel\Concerns\WithHeadings;
use DB;

class JobExecutorExport implements FromCollection, WithHeadings
{
    /**
    * @return \Illuminate\Support\Collection
    */
    public function collection()
    {
        return JobExecutor::leftJoin('job_status', DB::raw('CAST(job_executors.job_status AS INTEGER)'), '=', 'job_status.id')
                            ->leftJoin('map_boq_je', 'map_boq_je.je_id', '=', 'job_executors.id')
                            ->leftJoin('boqs', 'boqs.id', '=', 'map_boq_je.boq_id')
                            ->leftJoin('purchase_orders', 'purchase_orders.id', '=', 'boqs.po_id')
                            ->leftJoin('users', DB::raw('CAST(job_executors.inspector AS INTEGER)'), '=', 'users.id')
                            ->select(DB::RAW('ROW_NUMBER() OVER ()'), 'sos_no', 'purchase_orders.area', 'boqs.equipment', 'tag_number', 'users.name', 'inspection_date', 'document_check', 'job_status.status', 'minutes_no', 'minutes_note', 'minutes_date', 'coi_no', 'coi_date', 'expired_date', 'pic_company', 'bast_date', 'plo_number', 'plo_date', 'notes', 'job_executors.id')
                            ->get();
    }

    public function headings(): array
    {
        return ["No", "SOS No","Area","Equipment","Tag No", "Inspector","inspection Date","Document Check","Job Status","Minutes No", "Minutes Note", "Minutes Date","COI No","COI Date","Expired Date","PIC Company", "BAST Date", "PLO No", "PLO Date", "Notes", "ID (Jangan Dirubah!)"];
    }
}
