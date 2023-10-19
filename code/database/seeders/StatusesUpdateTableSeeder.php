<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class StatusesUpdateTableSeeder extends Seeder
{

    /**
     * Auto generated seed file
     *
     * @return void
     */
    public function run()
    {
        DB::table('statuses')->insert(array(
            0 =>
            array(
                'id' => 2,
                'name' => 'Pengembalian Dokumen',
                'created_at' => '2022-11-22 01:38:50',
                'updated_at' => '2022-11-22 01:38:50',
            )
        ));
    }
}
