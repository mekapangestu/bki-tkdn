<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;

class KelompokBarangTableSeeder extends Seeder
{

    /**
     * Auto generated seed file
     *
     * @return void
     */
    public function run()
    {


        DB::table('kelompok_barangs')->delete();

        DB::table('kelompok_barangs')->insert([
            ['id' => 1 ,'name' => 'Bahan Penunjang Pertanian'],
            ['id' => 2 ,'name' => 'Mesin dan Peralatan Pertanian'],
            ['id' => 3 ,'name' => 'Mesin dan Peralatan Pertambangan'],
            ['id' => 4 ,'name' => 'Mesin dan Peralatan Migas'],
            ['id' => 5 ,'name' => 'Alat Berat, Konstruksi dan Material Handling'],
            ['id' => 6 ,'name' => 'Mesin dan Peralatan Pabrik'],
            ['id' => 7 ,'name' => 'Bahan Bangunan/Konstruksi'],
            ['id' => 8 ,'name' => 'Logam dan Barang Logam'],
            ['id' => 9 ,'name' => 'Bahan Kimia dan Barang Kimia'],
            ['id' => 10 ,'name' => 'Peralatan Elektronika'],
            ['id' => 11 ,'name' => 'Peralatan Kelistrikan'],
            ['id' => 12 ,'name' => 'Peralatan Telekomunikasi'],
            ['id' => 13 ,'name' => 'Alat Transport'],
            ['id' => 14 ,'name' => 'Bahan dan Peralatan Kesehatan'],
            ['id' => 15 ,'name' => 'Peralatan Laboratrorium'],
            ['id' => 16 ,'name' => 'Komputer dan Peralatan Kantor'],
            ['id' => 17 ,'name' => 'Pakaian dan Perlengkapan Kerja'],
            ['id' => 18 ,'name' => 'Peralatan Olahraga dan Pendidikan'],
            ['id' => 19 ,'name' => 'Sarana Pertahanan'],
            ['id' => 20 ,'name' => 'Barang Lainnya'],
            ['id' => 21 ,'name' => 'Jasa Engineering, Procurement dan construction (EPC) dan Jasa Keteknikan'],
            ['id' => 22 ,'name' => 'Maritim'],
        ]);
    }
}
