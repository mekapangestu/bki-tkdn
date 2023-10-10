<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;

class StageStatusTableSeeder extends Seeder
{

    /**
     * Auto generated seed file
     *
     * @return void
     */
    public function run()
    {


        DB::table('stage_statuses')->delete();

        DB::table('stage_statuses')->insert([
            ['id' => 1 ,'name' => 'Perusahaan telah mengirimkan permohonan'],
            ['id' => 2 ,'name' => 'LVI telah verifikasi dokumen'],
            ['id' => 3 ,'name' => 'LVI telah verifikasi lapangan'],
            ['id' => 4 ,'name' => 'LVI telah melakukan QC'],
            ['id' => 5 ,'name' => 'Perusahaan menanggapi QC - Setuju'],
            ['id' => 6 ,'name' => 'LVI mengirim berkas ke kemenperin'],
            ['id' => 7 ,'name' => 'Pusat P3DN sedang melakukan review']
        ]);
    }
}
