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
            ['id' => 1 ,'name' => 'Perusahaan Telah Mengirimkan Permohonan'],
            ['id' => 2 ,'name' => 'LVI Telah Verifikasi Dokumen'],
            ['id' => 3 ,'name' => 'LVI Telah Verifikasi Lapangan'],
            ['id' => 4 ,'name' => 'LVI Telah Melakukan QC'],
            ['id' => 5 ,'name' => 'Perusahaan Menanggapi QC'],
            ['id' => 6 ,'name' => 'LVI Mengirim Berkas ke KEMENPERIN'],
            ['id' => 7 ,'name' => 'Pusat P3DN Sedang Melakukan Review'],
            ['id' => 8 ,'name' => 'Penetapan Jadwal Review'],
            ['id' => 9 ,'name' => 'Review Dokumen LVI & KEMENPERIN'],
            ['id' => 10 ,'name' => 'LVI Menjawab Rekomendasi Hasil Review'],
            ['id' => 11 ,'name' => 'KEMENPERIN Memeriksa Jawaban dan Hasil Review'],
            ['id' => 12 ,'name' => 'Penerbitan Sertifikat'],
        ]);
    }
}
