@extends('layouts.app')
@section('title', 'User Management')
@section('content')
    <div class="side-app">

        <!-- CONTAINER -->
        <div class="main-container container-fluid">

            <!-- PAGE-HEADER -->
            <div class="page-header">
                <h1 class="page-title">@yield('title')</h1>
                <div>
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="javascript:void(0)">Home</a></li>
                        <li class="breadcrumb-item active" aria-current="page">User Mgt.</li>
                    </ol>
                </div>

            </div>
            <!-- PAGE-HEADER END -->

            <!-- Row -->
            <div class="row row-sm">
                <div class="col-lg-12">
                    @if (session('error'))
                        <div class="alert alert-danger" role="alert">
                            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-hidden="true">×</button>
                            {{ session('error') }}
                        </div>
                    @elseif (session('success'))
                        <div class="alert alert-success" role="alert">
                            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-hidden="true">×</button>
                            {{ session('success') }}
                        </div>
                    @endif
                    <div class="card">
                        <div class="card-header">
                            <h3 class="card-title">Data List</h3>
                            <div class="card-options">
                                <div class="btn-group">
                                    <a class="btn btn-primary" href="{{ route('user.create') }}">
                                        <li class="fa fa-plus"></li>
                                        Add
                                    </a>
                                </div>
                            </div>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table id="file-datatable" class="table table-bordered text-wrap key-buttons border-bottom text-center">
                                    <thead>
                                        <tr>
                                            <th class="border-bottom-0" style="width: 5%">ID</th>
                                            <th class="border-bottom-0">Name</th>
                                            <th class="border-bottom-0">Email</th>
                                            <th class="border-bottom-0">Contact</th>
                                            <th class="border-bottom-0">Status</th>
                                            <th class="border-bottom-0">Role</th>
                                            <th class="border-bottom-0" style="width: 15%">Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        @foreach ($list as $user)
                                            <tr>
                                                <td>{{ $user->id }}</td>
                                                <td>{{ $user->name }}</td>
                                                <td>{{ $user->email }}</td>
                                                <td>{{ $user->contact }}</td>
                                                @if ($user->status == 'active')
                                                    <td class="text-center"><span class="badge rounded-pill bg-success text-white badge-sm me-1 mb-1 mt-1">Active</span></td>
                                                @else
                                                    <td class="text-center"><span class="badge rounded-pill bg-danger text-white badge-sm me-1 mb-1 mt-1">Inactive</span></td>
                                                @endif
                                                @foreach ($roles as $role)
                                                    @if ($role->id == $user->role_id)
                                                        <td>{{ $role->name }}</td>
                                                    @endif
                                                @endforeach
                                                <td>
                                                    <form action="{{ route('user.destroy', $user->id) }}" method="POST">
                                                        @csrf
                                                        @method('DELETE')
                                                        <input type="hidden" name="user_id" value="{{ $user->id }}">
                                                        <a href="{{ route('user.edit', $user->id) }}" class="btn text-secondary btn-sm" data-bs-toggle="tooltip" data-bs-original-title="Edit"><span class="fe fe-edit fs-14"></span></a>
                                                        <button class="btn text-danger btn-sm bg-white" onclick="deleteFunction()"><span class="fe fe-trash fs-14" data-bs-toggle="tooltip" data-bs-original-title="Delete"></span></button>
                                                    </form>
                                                </td>
                                            </tr>
                                        @endforeach
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- End Row -->
        </div>
        <!-- CONTAINER CLOSED -->

    </div>
@endsection
