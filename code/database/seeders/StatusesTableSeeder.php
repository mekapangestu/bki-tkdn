<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class StatusesTableSeeder extends Seeder
{

    /**
     * Auto generated seed file
     *
     * @return void
     */
    public function run()
    {


        DB::table('statuses')->delete();

        DB::table('statuses')->insert(array(
            0 =>
            array(
                'id' => 1,
                'name' => 'Terima',
                'created_at' => '2022-11-22 01:38:50',
                'updated_at' => '2022-11-22 01:38:50',
            ),
            1 =>
            array(
                'id' => 2,
                'name' => 'Terima Tidak Lengkap',
                'created_at' => '2022-11-22 01:50:58',
                'updated_at' => '2022-11-22 01:52:21',
            ),
            2 =>
            array(
                'id' => 3,
                'name' => 'Tolak',
                'created_at' => '2022-11-22 01:51:43',
                'updated_at' => '2022-11-22 01:51:43',
            ),
            3 =>
            array(
                'id' => 4,
                'name' => 'Freeze/Pending',
                'created_at' => '2022-11-22 01:51:43',
                'updated_at' => '2022-11-22 01:51:43',
            ),
        ));
    }
}
