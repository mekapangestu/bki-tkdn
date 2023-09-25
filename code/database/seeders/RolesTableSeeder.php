<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class RolesTableSeeder extends Seeder
{

    /**
     * Auto generated seed file
     *
     * @return void
     */
    public function run()
    {


        DB::table('roles')->delete();

        DB::table('roles')->insert(array(
            0 =>
            array(
                'id' => 1,
                'name' => 'superadmin',
                'guard_name' => 'web',
                'created_at' => '2022-11-22 01:38:50',
                'updated_at' => '2022-11-22 01:38:50',
            ),
            1 =>
            array(
                'id' => 2,
                'name' => 'administrator',
                'guard_name' => 'web',
                'created_at' => '2022-11-22 01:50:58',
                'updated_at' => '2022-11-22 01:52:21',
            ),
            2 =>
            array(
                'id' => 3,
                'name' => 'assessor',
                'guard_name' => 'web',
                'created_at' => '2022-11-22 01:51:43',
                'updated_at' => '2022-11-22 01:51:43',
            ),
            3 =>
            array(
                'id' => 4,
                'name' => 'kepala-verifikasi',
                'guard_name' => 'web',
                'created_at' => '2022-11-22 01:51:43',
                'updated_at' => '2022-11-22 01:51:43',
            ),
            4 =>
            array(
                'id' => 5,
                'name' => 'guest',
                'guard_name' => 'web',
                'created_at' => '2022-11-22 01:51:43',
                'updated_at' => '2022-11-22 01:51:43',
            ),
            5 =>
            array(
                'id' => 6,
                'name' => 'qc-officer',
                'guard_name' => 'web',
                'created_at' => '2022-11-22 01:51:43',
                'updated_at' => '2022-11-22 01:51:43',
            ),
        ));
    }
}
