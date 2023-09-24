<?php

namespace App\Exports;

use App\Models\Boq;
use Maatwebsite\Excel\Concerns\FromCollection;
use Maatwebsite\Excel\Concerns\WithHeadings;
use DB;

class BoqExport implements FromCollection, WithHeadings
{
    /**
    * @return \Illuminate\Support\Collection
    */
    public function collection()
    {
        return Boq::leftJoin('types', 'types.id', '=', DB::raw('CAST(boqs.project_type AS INTEGER)'))->leftJoin('purchase_orders', 'purchase_orders.id', '=', 'boqs.po_id')->select(DB::RAW('ROW_NUMBER() OVER ()'), 'po_no', 'area', 'types.user_input', 'equipment', 'tag_number', 'contract_value', 'size', 'dimension', 'capacity', 'note', 'boqs.id')->get();
    }

    public function headings(): array
    {
        return ["No", "PO Number", "Area", "Type","Equipment","Tag No.","Value","Size","Dimension","Capacity","Note", "ID (Jangan Dirubah!)"];
    }
}
