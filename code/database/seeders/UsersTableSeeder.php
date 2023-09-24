<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;

class UsersTableSeeder extends Seeder
{

    /**
     * Auto generated seed file
     *
     * @return void
     */
    public function run()
    {


        DB::table('users')->delete();

        DB::table('users')->insert(array(
            0 =>
            array(
                'name' => 'Superadmin',
                'contact' => '123',
                'role_id' => 1,
                'email' => 'sadmin@mail.com',
                'email_verified_at' => NULL,
                'password' => Hash::make('password'),
                'status' => 'active',
                'remember_token' => NULL,
                'created_at' => '2022-11-22 01:38:38',
                'updated_at' => '2022-11-22 01:42:36',
            ),
            1 =>
            array(
                'name' => 'Administrator',
                'contact' => '123',
                'role_id' => 2,
                'email' => 'admin@mail.com',
                'email_verified_at' => NULL,
                'password' => Hash::make('password'),
                'status' => 'active',
                'remember_token' => NULL,
                'created_at' => '2022-11-22 01:52:56',
                'updated_at' => '2022-11-22 01:58:43',
            ),
            2 =>
            array(
                'name' => 'Assessor',
                'contact' => '123',
                'role_id' => 3,
                'email' => 'assessor@mail.com',
                'email_verified_at' => NULL,
                'password' => Hash::make('password'),
                'status' => 'active',
                'remember_token' => NULL,
                'created_at' => '2022-11-22 01:53:39',
                'updated_at' => '2022-11-22 01:54:18',
            ),
            3 =>
            array(
                'name' => 'Kepala Verifikasi BKI',
                'contact' => '123',
                'role_id' => 4,
                'email' => 'kepala@mail.com',
                'email_verified_at' => NULL,
                'password' => Hash::make('password'),
                'status' => 'active',
                'remember_token' => NULL,
                'created_at' => '2022-11-22 01:53:39',
                'updated_at' => '2022-11-22 01:54:18',
            ),
            4 =>
            array(
                'name' => 'Guest',
                'contact' => '123',
                'role_id' => 5,
                'email' => 'guest@mail.com',
                'email_verified_at' => NULL,
                'password' => Hash::make('password'),
                'status' => 'active',
                'remember_token' => NULL,
                'created_at' => '2022-11-22 01:53:39',
                'updated_at' => '2022-11-22 01:54:18',
            ),
            5 =>
            array(
                'name' => 'QC Officer',
                'contact' => '123',
                'role_id' => 5,
                'email' => 'qc@mail.com',
                'email_verified_at' => NULL,
                'password' => Hash::make('password'),
                'status' => 'active',
                'remember_token' => NULL,
                'created_at' => '2022-11-22 01:53:39',
                'updated_at' => '2022-11-22 01:54:18',
            ),

        ));
    }
}
