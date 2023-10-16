@extends('layouts.auth')
@section('title', 'Reset Password')
@section('content')
    <!-- PAGE -->
    <div class="page">
        <div class="">

            <!-- CONTAINER OPEN -->
            <div class="col col-login mx-auto mt-7">
                <div class="text-center">
                    <a><img src="{{ asset('assets/images/bki-small-transparant.png') }}" style="width: 100px" class="header-brand-img" alt=""></a>
                </div>
            </div>
            {{-- @if ($errors->any())
                {!! implode('', $errors->all('<div>:message</div>')) !!}
            @endif --}}
            <div class="container-login100">
                <div class="wrap-login100 p-6">
                    <form method="POST" action="{{ route('password.update') }}">
                        @csrf
                        <!-- Password Reset Token -->
                        <input type="hidden" name="token" value="{{ $request->route('token') }}">

                        <span class="login100-form-title">
                            Reset Password
                        </span>

                        <div class="wrap-input100 validate-input input-group" data-bs-validate="Valid email is required: ex@abc.xyz">
                            <a href="javascript:void(0)" class="input-group-text bg-white text-muted">
                                <i class="zmdi zmdi-email" aria-hidden="true"></i>
                            </a>
                            <input class="input100 border-start-0 ms-0 form-control" type="email" name="email" placeholder="Email" password_confirmation>
                        </div>
                        <div class="wrap-input100 validate-input input-group" id="Password-toggle">
                            <a href="javascript:void(0)" class="input-group-text bg-white text-muted">
                                <i class="zmdi zmdi-eye" aria-hidden="true"></i>
                            </a>
                            <input class="input100 border-start-0 ms-0 form-control" type="password" name="password" placeholder="Password">
                        </div>
                        <div class="wrap-input100 validate-input input-group" id="Password-toggle">
                            <a href="javascript:void(0)" class="input-group-text bg-white text-muted">
                                <i class="zmdi zmdi-eye" aria-hidden="true"></i>
                            </a>
                            <input class="input100 border-start-0 ms-0 form-control" type="password" name="password_confirmation" placeholder="Password Confirmation">
                        </div>
    
                        <div class="container-login100-form-btn">
                            <button type="submit" class="login100-form-btn btn-primary">
                                Submit
                            </button>
                        </div>
                        <div class="text-center pt-3">
                            <p class="text-dark mb-0">Already have account?<a href="{{ route('login') }}" class="text-primary ms-1">Sign In</a></p>
                        </div>
                    </form>
                </div>
            </div>
            <!-- CONTAINER CLOSED -->
        </div>
    </div>
    <!-- END PAGE -->
@endsection
