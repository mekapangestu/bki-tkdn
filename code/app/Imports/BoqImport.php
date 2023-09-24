<?php

namespace App\Imports;

use App\Models\Boq;
use App\Models\Type;
use App\Models\PurchaseOrder;
use Illuminate\Support\Collection;
use Maatwebsite\Excel\Concerns\WithStartRow;
use Maatwebsite\Excel\Concerns\ToCollection;

class BoqImport implements ToCollection, WithStartRow
{
    /**
     * @return int
     */
    public function startRow(): int
    {
        return 2;
    }

    public function collection(Collection $rows)
    {
        foreach ($rows as $row) {
            $po_no = PurchaseOrder::where('po_no', $row[1])->where('area', $row[2])->first();
            if (!$po_no) {
                throw new \ErrorException('PO not found! (PO Number: '. $row[1]. ' Area: '. $row[2].')');
            }
            
            $project_type = Type::where('user_input', strtoupper($row[3]))->first();
            if (!$project_type) {
                throw new \ErrorException('Project Type not found! ('.$row[3].')');
            }
            
            $dataImport = [
                'po_id'            => $po_no->id,
                'project_type'     => $project_type->id,
                'equipment'        => $row[4] ?? '-',
                'tag_number'       => $row[5] ?? '-',
                'contract_value'   => filter_var($row[6], FILTER_SANITIZE_NUMBER_INT) ?? '0',
                'size'             => $row[7] ?? '-',
                'dimension'        => $row[8] ?? '-',
                'capacity'         => $row[9] ?? '-',
                'note'             => $row[10] ?? '-'
            ];

            Boq::updateOrCreate(['id' => $row[11]??null], $dataImport);
        }
    }
}
