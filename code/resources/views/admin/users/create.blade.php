@extends('layouts.app')
@section('title', 'Add User')
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
                        <li class="breadcrumb-item"><a href="{{ route('role.index') }}">User Mgt.</a></li>
                        <li class="breadcrumb-item active" aria-current="page">@yield('title')</li>
                    </ol>
                </div>

            </div>
            <!-- PAGE-HEADER END -->

            <!-- Row -->
            <div class="row row-sm">
                <div class="col-lg-12">
                    <div class="card">
                        <div class="card-header">
                            <h3 class="card-title">@yield('title')</h3>
                        </div>
                        <div class="card-body">
                            @if ($errors->any())
                                @foreach ($errors->all() as $error)
                                    <div class="alert alert-danger">{{ $error }}</div>
                                @endforeach
                            @endif
                            <form method="POST" action="{{ route('user.store') }}" method="POST">
                                @csrf
                                <div class="row">
                                    <div class="col-6">
                                        <div class="form-group">
                                            <label for="name" class="form-label">Name</label>
                                            <input type="text" class="form-control" id="name" autocomplete="off" name="name" placeholder="Enter FullName" required>
                                        </div>
                                        <div class="form-group">
                                            <label for="contact" class="form-label">Contact</label>
                                            <input type="text" class="form-control" id="contact" autocomplete="off" name="contact" placeholder="Enter Contact" required>
                                        </div>
                                        <div class="form-group">
                                            <label for="type" class="form-label">Role</label>
                                            <select class="form-control" name="role_id">
                                                @foreach ($list as $role)
                                                    <option value="{{ $role->id }}">{{ $role->name }}</option>
                                                @endforeach
                                            </select>
                                        </div>
                                        <div class="form-group">
                                            <label for="type" class="form-label">Status</label>
                                            <select class="form-control" name="status">
                                                <option value="active">Active</option>
                                                <option value="inactive">Inactive</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-6">
                                        <div class="form-group">
                                            <label for="email" class="form-label">Email</label>
                                            <input type="email" class="form-control" id="email" autocomplete="off" name="email" placeholder="Enter Email" required>
                                        </div>
                                        <div class="form-group">
                                            <label for="password" class="form-label">Password</label>
                                            <input type="password" class="form-control" id="password" autocomplete="off" name="password" placeholder="Enter Password" required>
                                        </div>
                                        <div class="form-group">
                                            <label for="password" class="form-label">Password Confirmation</label>
                                            <input type="password" class="form-control" id="password_confirmation" autocomplete="off" name="password_confirmation" placeholder="Re-Enter Password" required>
                                        </div>
                                    </div>
                                </div>
                                <br>
                                <button type="submit" class="btn btn-primary mt-4 mb-0">Submit</button> <a href="{{ route('user.index') }}" class="btn btn-secondary mt-4 mb-0">Back</a>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <!-- End Row -->
        </div>
        <!-- CONTAINER CLOSED -->

    </div>
@endsection
