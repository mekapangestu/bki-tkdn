<?php

namespace App\Helpers;

use Str;

class Slug
{
    public static function lower($item)
    {
        return Str::lower(Str::slug($item, '_'));
    }
}
