<?php

namespace App\Http\Controllers\Api;

use App\Models\Role;
use App\Models\User;
use App\Models\Orders;
use App\Models\Projects;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Mail;

class OrdersController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        try {
            $docNumber = (int)$request->get('no_berkas');
            if ($docNumber > 0) {
                $project = Projects::where('no_berkas', $docNumber)->first();
                if ($project) {
                    $project->update([
                        "nib" => $request->get('nib'),
                        "npwp" => $request->get('npwp'),
                        "kd_produk" => $request->get('kd_produk'),
                        "nama_cp" => $request->get('nama_cp'),
                        "jabatan_cp" => $request->get('jabatan_cp'),
                        "no_hp_cp" => $request->get('no_hp_cp'),
                        "alamat_kantor" => $request->get('alamat_kantor'),
                        "alamat_pabrik" => $request->get('alamat_pabrik'),
                    ]);
                } else {
                    $user = new User();
                    $user->name = $request->get('nama_cp');
                    $user->contact = 0;
                    $user->email = $request->get('email_cp');

                    $role = Role::find(5);
                    $user->assignRole($role->name);
                    $user->role_id = 5;

                    $user->status = "active";
                    $password = time();
                    $user->password = bcrypt($password);

                    $user->save();
                    
                    $project = Projects::create([
                        "user_id" => $user->id,
                        "no_berkas" => $request->get('no_berkas'),
                        "nib" => $request->get('nib'),
                        "npwp" => $request->get('npwp'),
                        "kd_produk" => $request->get('kd_produk'),
                        "nama_cp" => $request->get('nama_cp'),
                        "jabatan_cp" => $request->get('jabatan_cp'),
                        "no_hp_cp" => $request->get('no_hp_cp'),
                        "alamat_kantor" => $request->get('alamat_kantor'),
                        "alamat_pabrik" => $request->get('alamat_pabrik'),
                    ]);

                    Mail::send('emails.welcome', ['name' => $request->get('nama_cp'), 'email' => $request->get('email_cp'), 'password' => $password], function ($message) use ($request) {
                        $message->from('no-reply@site.com', "Site name");
                        $message->subject("Welcome to site name");
                        $message->to($request->get('email_cp'));
                    });
                }

                $order = Orders::create([
                    'siinas_data' => json_encode($request->all(), JSON_PRETTY_PRINT),
                    "no_berkas" => $request->get('no_berkas'),
                    "nib" => $request->get('nib'),
                    "npwp" => $request->get('npwp'),
                    "verifikator" => $request->get('verifikator'),
                    "kd_produk" => $request->get('kd_produk'),
                    "nama_cp" => $request->get('nama_cp'),
                    "jabatan_cp" => $request->get('jabatan_cp'),
                    "no_hp_cp" => $request->get('no_hp_cp'),
                    "alamat_kantor" => $request->get('alamat_kantor'),
                    "alamat_pabrik" => $request->get('alamat_pabrik'),
                ]);
            } else {
                return response()->json([
                    "status" => 0,
                    "data" => "tidak ada",
                    "tahap" => "1",
                    "message" => "error: nomor berkas tidak dapat dibaca",
                    "url" => null,
                ]);
            }

            return response()->json([
                "status" => "1",
                "data" => "ada",
                "tahap" => "1",
                "message" => "ok",
                "url" => url("/projects/{$project->id}"),
            ]);
        } catch (\Throwable $throwable) {
            return response()->json([
                "status" => 0,
                "data" => "tidak ada",
                "tahap" => "1",
                "message" => "error: " . $throwable->getMessage(),
                "url" => null,
            ]);
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Orders  $orders
     * @return \Illuminate\Http\Response
     */
    public function show(Orders $orders)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Orders  $orders
     * @return \Illuminate\Http\Response
     */
    public function edit(Orders $orders)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Orders  $orders
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Orders $orders)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Orders  $orders
     * @return \Illuminate\Http\Response
     */
    public function destroy(Orders $orders)
    {
        //
    }
}
