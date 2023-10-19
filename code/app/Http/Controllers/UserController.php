<?php

namespace App\Http\Controllers;

use App\Models\Boq;
use App\Models\Category;
use App\Models\Certification;
use App\Models\Role;
use App\Models\Type;
use App\Models\User;
use App\Models\UserDetail;
use App\Models\Coi;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\File;
use Illuminate\Support\Facades\Hash;
use Illuminate\Validation\Rules;
use Illuminate\Support\Facades\Crypt;
use Illuminate\Contracts\Encryption\DecryptException;
use Vinkla\Hashids\Facades\Hashids;
use App\Traits\Util;

class UserController extends Controller
{
    use Util;
    
    public function profile()
    {
        $user = auth()->user();
        // dd($user);
        $detail = DB::table('user_details')->where('user_id', $user->id)->first();
        // dd($detail);
        if(is_null($detail)){
            $detail = new UserDetail();
        }

        $title = "Profile";
        // dd($detail);
        return view('admin.profile', compact('user', 'detail', 'title'));
    }

    public function updateProfile(Request $request, $id){
        try {
            $model = User::find($id);
            $model->name = $request->name;
            $model->contact = $request->contact;
            $model->email = $request->email;
            $model->update();

            
            // dd($model);
            $userPath = public_path('storage/files/users/' . now()->format('dmy') . '_' . $model->id);
            // dd($folderPath);
            if (!File::isDirectory($userPath)) {
                File::makeDirectory($userPath, 0777, true, true);
            }
            
            $userDetail = UserDetail::where('user_id', auth()->user()->id)->first();
            // dd($userDetail);
            if ($userDetail) {
                $userDetail->user_id = $id;
                // $userDetail->category = $request->category;
                $userDetail->expired_date = $request->expired_date; 
                $userDetail->jabatan = $request->jabatan;                   
                    // dd($userDetail);
                    $userDetail->update();
            }else{
                // dd('Empty');
                $userDetail = new UserDetail();
                $userDetail->user_id = $id;
                // $userDetail->category = $request->category;
                $userDetail->expired_date = $request->expired_date;
                $userDetail->jabatan = $request->jabatan;
                
                $userDetail->save();
            }

            if (isset($request->cert_skill)) {
                $this->singleUpload(1, $request->file('cert_skill'), $model->id, 'certificate_skill', 'users');
            }
            
            // dd($userDetail);
            return redirect('profile')->with('success', 'Profile has been updated');
        } catch (\Exception $e) {
            return redirect('profile')->with('error', $e->getMessage());
        }
    }

    public function index()
    {
        $list = User::all();
        $roles = Role::all();

        $title = "User Management";

        return view('admin.users.index', compact('list', 'roles', 'title'));
    }

    public function create()
    {
        $list = Role::all();
        return view('admin.users.create', compact('list'));
    }

    public function store(Request $request)
    {
        try {
            $request->validate([
                'name' => ['required', 'string', 'max:255'],
                'contact' => ['required', 'string', 'max:16'],
                'email' => ['required', 'string', 'email', 'max:255', 'unique:users'],
                'password' => ['required', 'confirmed', Rules\Password::defaults()],
            ]);

            $model = new User();
            $model->name = $request->name;
            $model->contact = $request->contact;
            $model->email = $request->email;

            $role = Role::find($request->role_id);
            $model->assignRole($role->name);
            $model->role_id = $request->role_id;

            $model->status = $request->status;
            $model->password = Hash::make($request->password);

            $model->save();

            return redirect('user')->with('success', 'New User has been added successfully');
        } catch (\Exception $e) {
            return redirect('user')->with('error', $e->getMessage());
        }
    }

    public function edit($id)
    {
        $user = User::find($id);
        $roles = Role::all();
        return view('admin.users.edit', compact('user', 'roles'));
    }

    public function update(Request $request, $id)
    {
        // dd($request);
        try {
            // $request->validate([
            //     'name' => ['required', 'string', 'max:255'],
            //     'contact' => ['required', 'string', 'max:16'],
            //     'email' => ['required', 'string', 'email', 'max:255', 'unique:users'],
            //     'password' => ['required', 'confirmed', Rules\Password::defaults()],
            // ]);

            // dd($request);

            $model = User::find($id);
            $model->name = $request->name;
            $model->contact = $request->contact;
            $model->email = $request->email;

            $oldRole = Role::find($model->role_id);
            $newRole = Role::find($request->role_id);
            $model->removeRole($oldRole->name);
            $model->assignRole($newRole->name);
            $model->role_id = $request->role_id;

            $model->status = $request->status;
            if ($model->password != $request->password) {
                $model->password = Hash::make($request->password);
            } else {
                $model->password = $request->password;
            }

            $model->update();

            return redirect('user')->with('success', 'User has been updated');
        } catch (\Exception $e) {
            return redirect('user')->with('error', $e->getMessage());
        }
    }

    public function destroy($id)
    {
        try {
            $user = User::find($id);
            $user->delete();

            return redirect('user')->with('error', 'User Is Deleted');
        } catch (\Exception $e) {
            return redirect('user')->with('error', $e->getMessage());
        }
    }
}
