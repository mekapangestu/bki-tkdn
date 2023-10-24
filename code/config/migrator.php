<?php

return [
    /*
    |--------------------------------------------------------------------------
    | Routing
    | Migrator route address to access the module, i.e. 'localhost:8000/migrator'
    |--------------------------------------------------------------------------
    */
    'route' => 'migrator',

    /*
    |--------------------------------------------------------------------------
    | Middlewares
    | Middlewares used to access the Migrator route
    |--------------------------------------------------------------------------
    */
    'middleware' => ['role:superadmin'],

    /*
    |--------------------------------------------------------------------------
    | Only on local
    | The flag that prevents showing commands if the environment is in production
    |--------------------------------------------------------------------------
    */
    'local' => false,

    /*
    |--------------------------------------------------------------------------
    | Pagination
    | The number of items per page in pagination
    |--------------------------------------------------------------------------
    */
    'per_page' => 15,
];
