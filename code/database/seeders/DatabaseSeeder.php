<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     *
     * @return void
     */
    public function run()
    {
        // User::factory(10)->create();
        $this->call(UsersTableSeeder::class);
        $this->call(RolesTableSeeder::class);
        $this->call(ModelHasRolesTableSeeder::class);
        $this->call(StatusesTableSeeder::class);
        $this->call(KelompokBarangTableSeeder::class);
        $this->call(StageStatusTableSeeder::class);
        $this->call(StatusesUpdateTableSeeder::class);
    }
}
