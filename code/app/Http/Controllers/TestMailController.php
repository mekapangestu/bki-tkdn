<?php

namespace App\Http\Controllers;

use App\Mail\VerifyFinalSubmit;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Mail;

class TestMailController extends Controller
{
    public function send_email()
    {
        $details = [
            'body' => 'Hi Mulia, Permohonan anda telah dikembalikan dengan alasan:',
            'line' => 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Officia incidunt dolorem numquam itaque quos quis quibusdam! Ad, quas tempore maiores necessitatibus, fuga, repudiandae vel qui quisquam nam a voluptatem harum!',
            'actionText' => null,
            'actionURL' => null
        ];
        try {
            Mail::to('muliaabdim@gmail.com')->send(new VerifyFinalSubmit($details));

            return 'Sukses';
        } catch (\Throwable $th) {
            throw $th;
        }
    }
}
