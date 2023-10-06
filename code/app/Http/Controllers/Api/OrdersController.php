<?php

namespace App\Http\Controllers\Api;

use App\Models\Role;
use App\Models\User;
use App\Models\Orders;
use App\Models\Projects;
use Illuminate\Http\Request;
use App\Models\DocumentReceipt;
use Illuminate\Support\Facades\DB;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Mail;
use App\Notifications\ProjectNotification;

class OrdersController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
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
        DB::beginTransaction();
        try {
            $project = Projects::where('nib', $request->get('nib'))->first();
            if ($project) {
                $user = User::find($project->user_id);
                $no_berkas = Projects::where('no_berkas', $request->get('no_berkas'))->first();
                if ($no_berkas) {
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
                    $project = Projects::create([
                        "user_id" => $project->user_id,
                        "no_berkas" => $request->get('no_berkas'),
                        "nib" => $request->get('nib'),
                        "npwp" => $request->get('npwp'),
                        "kd_produk" => $request->get('kd_produk'),
                        "nama_cp" => $request->get('nama_cp'),
                        "jabatan_cp" => $request->get('jabatan_cp'),
                        "no_hp_cp" => $request->get('no_hp_cp'),
                        "alamat_kantor" => $request->get('alamat_kantor'),
                        "alamat_pabrik" => $request->get('alamat_pabrik'),
                        "stage" => 1,
                    ]);
                }
            } else {
                $user = new User();
                $user->name = $request->get('nama_cp');
                $user->contact = 0;
                $user->email = $request->get('email_cp');

                $role = Role::find(5);
                $user->assignRole($role->name);
                $user->role_id = 5;

                $user->status = "active";
                $password = 'password';
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
                    "stage" => 1,
                ]);
                                    
                // Mail::send('emails.welcome', ['name' => $request->get('nama_cp'), 'email' => $request->get('email_cp'), 'password' => $password], function ($message) use ($request) {
                //     $message->from('no-reply@site.com', "Site name");
                //     $message->subject("Welcome to site name");
                //     $message->to($request->get('email_cp'));
                // });
            }
            
            Orders::create([
                'siinas_data' => $request->all(),
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

            $documentReceipt = new DocumentReceipt();
            $documentReceipt->project_id = $project->id;
            $documentReceipt->stage = 1;
            $documentReceipt->payload = json_encode($request->all());
            $documentReceipt->end_point = url('api/v1/permohonan');
            $documentReceipt->siinas_response = json_encode([
                "status" => "1",
                "data" => "ada",
                "tahap" => "1",
                "message" => "ok",
                "url" => url("/projects/{$project->id}"),
            ], JSON_PRETTY_PRINT);
            $documentReceipt->siinas_post_at = now();

            $documentReceipt->save();

            $admin = User::find(2);

            $details = [
                'from' => $user->id,
                'message' => 'Submit Dokumen Baru ' . $project->no_berkas,
                'actionURL' => route('projects.verify-admin2', $project->id)
            ];

            $admin->notify(new ProjectNotification($details));

            DB::commit();

            return response()->json([
                "status" => "1",
                "data" => "ada",
                "tahap" => "1",
                "message" => "ok",
                "url" => url("/projects/{$project->id}"),
            ]);
        } catch (\Throwable $throwable) {
            DB::rollback();
            return response()->json([
                "status" => 0,
                "data" => "tidak ada",
                "tahap" => "1",
                "message" => "error: nomor berkas tidak dapat dibaca",
                "url" => null,
            ]);
            // return response()->json([
            //     "status" => 0,
            //     "data" => "tidak ada",
            //     "tahap" => "1",
            //     "message" => "error: " . $throwable->getMessage(),
            //     "url" => null,
            // ]);
        }
    }

    public function permohonan(Request $request)
    {
        $return = [];
        switch ($request->tahap) {
            case '3': $return = $this->tahap3($request); break;
            case '5': $return = $this->tahap5($request); break;
            case '7': $return = $this->tahap7($request); break;
            case '8': $return = $this->tahap8($request); break;
            case '9': $return = $this->tahap9($request); break;
            case '11': $return = $this->tahap11($request); break;
            case '12': $return = $this->tahap12($request); break;
            default: break;
        }

        $documentReceipt = new DocumentReceipt();
        $documentReceipt->project_id = Projects::where('no_berkas', (int)$request->get('no_berkas'))->first()?->id;
        $documentReceipt->stage = $request->tahap;
        $documentReceipt->end_point = url('api/v1/permohonan');
        $documentReceipt->payload = json_encode($request->all());

        $documentReceipt->siinas_response = $return;

        $documentReceipt->siinas_post_at = now();

        $documentReceipt->save();   

        return $return;
    }

    public function tahap3(Request $request)
    {
        try {
            $docNumber = (int)$request->get('no_berkas');
            $project = Projects::where('no_berkas', $docNumber)->first();
            if ($project) {
                $project->stage = 3;
                $project->save();
                return response()->json([
                    "status" => "1",
                    "data" => "ada",
                    "tahap" => "3",
                    "message" => "ok"
                ]);
            }

            return response()->json([
                "status" => 0,
                "data" => "tidak ada",
                "tahap" => "3",
                "message" => "error: nomor berkas tidak dapat dibaca",
            ]);
        } catch (\Throwable $throwable) {
            return response()->json([
                "status" => 0,
                "data" => "tidak ada",
                "tahap" => "3",
                "message" => "error: " . $throwable->getMessage(),
                "url" => null,
            ]);
        }
    }

    public function tahap5(Request $request)
    {
        try {
            $docNumber = (int)$request->get('no_berkas');
            $project = Projects::where('no_berkas', $docNumber)->first();
            if ($project) {
                $project->stage = 5;
                $project->save();

                $admin = User::find(2);

                $details = [
                    'from' => 'Siinas',
                    'message' => 'Submit Tahap 5 untuk berkas ' . $project->no_berkas,
                    'actionURL' => route('projects.verify-admin2', $project->id)
                ];

                $admin->notify(new ProjectNotification($details));

                return response()->json([
                    "status" => "1",
                    "data" => "ada",
                    "tahap" => "5",
                    "message" => "ok"
                ]);
            }

            return response()->json([
                "status" => 0,
                "data" => "tidak ada",
                "tahap" => "5",
                "message" => "error: nomor berkas tidak dapat dibaca",
            ]);
        } catch (\Throwable $throwable) {
            return response()->json([
                "status" => 0,
                "data" => "tidak ada",
                "tahap" => "5",
                "message" => "error: " . $throwable->getMessage(),
                "url" => null,
            ]);
        }
    }

    public function tahap7(Request $request)
    {
        try {
            $docNumber = (int)$request->get('no_berkas');
            $project = Projects::where('no_berkas', $docNumber)->first();
            if ($project) {
                if ($request->get('status') == "0") {
                    $project->stage = 5;
                }else{
                    $project->stage = 7;
                }
                $project->save();

                $admin = User::find(2);

                $details = [
                    'from' => 'Siinas',
                    'message' => $request->get('status') == "0" ? 'Menolak':'Menerima'. ' Tahap 7 untuk berkas ' . $project->no_berkas,
                    'actionURL' => route('projects.verify-admin2', $project->id)
                ];

                $admin->notify(new ProjectNotification($details));

                return response()->json([
                    "status" => $request->get('status'),
                    "data" => "ada",
                    "tahap" => "7",
                    "message" => "ok"
                ]);
            }

            return response()->json([
                "status" => 0,
                "data" => "tidak ada",
                "tahap" => "7",
                "message" => "error: nomor berkas tidak dapat dibaca",
            ]);
        } catch (\Throwable $throwable) {
            return response()->json([
                "status" => 0,
                "data" => "tidak ada",
                "tahap" => "7",
                "message" => "error: " . $throwable->getMessage(),
                "url" => null,
            ]);
        }
    }

    public function tahap8(Request $request)
    {
        try {
            $docNumber = (int)$request->get('no_berkas');
            $project = Projects::where('no_berkas', $docNumber)->first();
            if ($project) {
                $project->stage = 8;
                $project->nm_reviewer = $request->get('nm_reviewer');
                $project->tgl_rencana_review = $request->get('tgl_rencana_review');
                $project->save();
                $admin = User::find(2);

                $details = [
                    'from' => 'Siinas',
                    'message' => $request->get('status') == "0" ? 'Menolak' : 'Menerima' . ' Tahap 8 untuk berkas ' . $project->no_berkas,
                    'actionURL' => route('projects.verify-admin2', $project->id)
                ];

                $admin->notify(new ProjectNotification($details));

                return response()->json([
                    "status" => "1",
                    "data" => "ada",
                    "tahap" => "8",
                    "message" => "ok"
                ]);
            }

            return response()->json([
                "status" => 0,
                "data" => "tidak ada",
                "tahap" => "8",
                "message" => "error: nomor berkas tidak dapat dibaca",
            ]);
        } catch (\Throwable $throwable) {
            return response()->json([
                "status" => 0,
                "data" => "tidak ada",
                "tahap" => "8",
                "message" => "error: " . $throwable->getMessage(),
                "url" => null,
            ]);
        }
    }

    public function tahap9(Request $request)
    {
        try {
            $docNumber = (int)$request->get('no_berkas');
            $project = Projects::where('no_berkas', $docNumber)->first();
            if ($project) {
                $project->stage = 9;
                $project->tgl_pelaksanaan_reviu = $request->get('tgl_pelaksanaan_reviu');
                $project->mom = $request->get('mom');
                $project->catatan = $request->get('catatan');
                $project->save();

                $admin = User::find(2);

                $details = [
                    'from' => 'Siinas',
                    'message' => $request->get('status') == "0" ? 'Menolak' : 'Menerima' . ' Tahap 9 untuk berkas ' . $project->no_berkas,
                    'actionURL' => route('projects.verify-admin2', $project->id)
                ];

                $admin->notify(new ProjectNotification($details));

                return response()->json([
                    "status" => "1",
                    "data" => "ada",
                    "tahap" => "9",
                    "message" => "ok"
                ]);
            }

            return response()->json([
                "status" => 0,
                "data" => "tidak ada",
                "tahap" => "9",
                "message" => "error: nomor berkas tidak dapat dibaca",
            ]);
        } catch (\Throwable $throwable) {
            return response()->json([
                "status" => 0,
                "data" => "tidak ada",
                "tahap" => "9",
                "message" => "error: " . $throwable->getMessage(),
                "url" => null,
            ]);
        }
    }

    public function tahap11(Request $request)
    {
        try {
            $docNumber = (int)$request->get('no_berkas');
            $project = Projects::where('no_berkas', $docNumber)->first();
            if ($project) {
                $project->alasan_tidak_sesuai = $request->get('alasan_tidak_sesuai');
                if ($request->get('status') == "0") {
                    $project->stage = 10;
                } else {
                    $project->stage = 11;
                }
                $project->save();

                $admin = User::find(2);

                $details = [
                    'from' => 'Siinas',
                    'message' => $request->get('status') == "0" ? 'Menolak' : 'Menerima' . ' Tahap 11 untuk berkas ' . $project->no_berkas,
                    'actionURL' => route('projects.verify-admin2', $project->id)
                ];

                $admin->notify(new ProjectNotification($details));

                return response()->json([
                    "status" => "1",
                    "data" => "ada",
                    "tahap" => $project->stage,
                    "message" => "ok"
                ]);
            }

            return response()->json([
                "status" => 0,
                "data" => "tidak ada",
                "tahap" => "11",
                "message" => "error: nomor berkas tidak dapat dibaca",
            ]);
        } catch (\Throwable $throwable) {
            return response()->json([
                "status" => 0,
                "data" => "tidak ada",
                "tahap" => "11",
                "message" => "error: " . $throwable->getMessage(),
                "url" => null,
            ]);
        }
    }

    public function tahap12(Request $request)
    {
        try {
            $docNumber = (int)$request->get('no_berkas');
            $project = Projects::where('no_berkas', $docNumber)->first();
            if ($project) {
                $project->stage = 12;
                $project->alasan_tolak = $request->get('alasan_tolak');
                $project->no_tanda_sah = $request->get('no_tanda_sah');
                $project->tgl_tanda_sah = $request->get('tgl_tanda_sah');
                $project->tgl_expire = $request->get('tgl_expire');
                $project->url_sertifikat_terbit = $request->get('url_sertifikat_terbit');
                $project->save();

                $admin = User::find(2);

                $details = [
                    'from' => 'Siinas',
                    'message' => $request->get('status') == "0" ? 'Menolak' : 'Menerima' . ' Tahap 12 untuk berkas ' . $project->no_berkas,
                    'actionURL' => route('projects.verify-admin2', $project->id)
                ];

                $admin->notify(new ProjectNotification($details));

                return response()->json([
                    "status" => "1",
                    "data" => "ada",
                    "tahap" => "12",
                    "message" => "ok"
                ]);
            }

            return response()->json([
                "status" => 0,
                "data" => "tidak ada",
                "tahap" => "12",
                "message" => "error: nomor berkas tidak dapat dibaca",
            ]);
        } catch (\Throwable $throwable) {
            return response()->json([
                "status" => 0,
                "data" => "tidak ada",
                "tahap" => "12",
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
