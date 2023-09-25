<?php

namespace App\Imports;

use App\Models\JobExecutor;
use Maatwebsite\Excel\Concerns\WithStartRow;
use Illuminate\Support\Collection;
use Maatwebsite\Excel\Concerns\ToCollection;
use DB;

class JobExecutorImport implements ToCollection, WithStartRow
{
    /**
     * @return int
     */
    public function startRow(): int
    {
        return 2;
    }
    
    /**
    * @param array $row
    *
    * @return \Illuminate\Database\Eloquent\Model|null
    */
    public function collection(Collection $rows)
    {
        foreach ($rows as $row) {
            $job_status = DB::table('job_status')->where('status', $row[8])->first();
            if (!$job_status) {
                throw new \ErrorException('Status not found! (' . $row[8] . ')');
            }
            $inspector = DB::table('users')->where('name', $row[5])->first();
            if (!$inspector) {
                throw new \ErrorException('User not found! (' . $row[5] . ')');
            }

            $job = JobExecutor::find($row[20]);
            $job->sos_no = $row[1];
            $job->inspector = $inspector->id;
            $job->inspection_date = $row[6]?$this->formatDateExcel($row[6]):null;
            $job->document_check = $row[7] == 'TRUE' ? true:false;
            $job->job_status = $job_status->id;
            $job->minutes_no = $row[9];
            $job->minutes_note = $row[10];
            $job->minutes_date = $row[11]?$this->formatDateExcel($row[11]):null;
            $job->coi_no = $row[12];
            $job->coi_date = $row[13]?$this->formatDateExcel($row[13]) : null;
            $job->expired_date = $row[14]?$this->formatDateExcel($row[14]):null;
            $job->pic_company = $row[15];
            $job->bast_date = $row[16]?$this->formatDateExcel($row[16]):null;
            $job->plo_number = $row[17];
            $job->plo_date = $row[18]?$this->formatDateExcel($row[18]):null;
            $job->notes = $row[19];

            $job->update();
        }
    }

    protected function formatDateExcel($date)
    {
        if ('string' === gettype($date)) {
            return $date;
        }

        return \Carbon\Carbon::instance(\PhpOffice\PhpSpreadsheet\Shared\Date::excelToDateTimeObject((int)$date))->format('Y-m-d');
    }
}
