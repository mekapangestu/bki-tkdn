<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;

class ProductCategoriesTableSeeder extends Seeder
{

    /**
     * Auto generated seed file
     *
     * @return void
     */
    public function run()
    {
        

        \DB::table('product_categories')->delete();
        
        \DB::table('product_categories')->insert(array (
            0 => 
            array (
                'id' => 1,
                'nama_kategori' => 'Elektronika dan Telematika',
                'created_at' => '2023-11-18 21:06:23',
                'updated_at' => NULL,
            ),
            1 => 
            array (
                'id' => 2,
                'nama_kategori' => 'Kendaraan Bermotor Listrik Berbasis Baterai',
                'created_at' => '2023-11-18 21:06:23',
                'updated_at' => NULL,
            ),
            2 => 
            array (
                'id' => 3,
                'nama_kategori' => 'Pembangkit Listrik Tenaga Surya',
                'created_at' => '2023-11-18 21:06:23',
                'updated_at' => NULL,
            ),
            3 => 
            array (
                'id' => 4,
                'nama_kategori' => 'Farmasi',
                'created_at' => '2023-11-18 21:06:23',
                'updated_at' => NULL,
            ),
            4 => 
            array (
                'id' => 5,
            'nama_kategori' => 'Telepon Seluler, Komputer Genggam (Handheld), dan Komputer Tablet',
                'created_at' => '2023-11-18 21:06:23',
                'updated_at' => NULL,
            ),
            5 => 
            array (
                'id' => 6,
                'nama_kategori' => 'Alat Kesehatan dan Alat Kesehatan Diagnostik in Vitro',
                'created_at' => '2023-11-18 21:06:23',
                'updated_at' => NULL,
            ),
            6 => 
            array (
                'id' => 99,
                'nama_kategori' => 'Lainnya',
                'created_at' => '2023-11-18 21:06:23',
                'updated_at' => NULL,
            ),
        ));
        
        
    }
}