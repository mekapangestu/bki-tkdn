<?php

namespace App\Http\Controllers;

use App\Models\Role;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class RoleController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $list = Role::all();
        $title = "Role Management";

        return view('admin.roles.index', compact('list', 'title'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $title = "Create Role";
        return view('admin.roles.create', compact('title'));
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
            $total = Role::latest('id')->first();
            $model = new Role();
            $model->id = $total->id + 1;
            $model->name = $request->name;
            $model->guard_name = "web";
            $model->save();

            return redirect('role')->with('success', 'New role added successfully');
        } catch (\Exception $e) {
            return redirect('role')->with('error', $e->getMessage());
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show(Role $roles)
    {
        $user = User::find(auth()->id());
        return view('admin.roles.index', ['roles' => $roles]);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $user = User::find(auth()->id());
        $role = Role::find($id);
        $title = "Edit Role";
        return view('admin.roles.edit', compact('role', 'user', 'title'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        try {
            $model = Role::find($id);
            $model->name = $request->name;
            $model->save();

            return redirect('role')->with('success', 'Role has been updated');
        } catch (\Exception $e) {
            return redirect('role')->with('error', $e->getMessage());
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $model = Role::find($id);
        $model->delete();
        return redirect('role')->with('error', 'Role has been deleted');
    }
}
