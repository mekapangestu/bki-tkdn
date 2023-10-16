@extends('layouts.auth')
@section('title', 'Forgot Password')
@section('content')
    <!-- PAGE -->
    <div class="page">
        <div class="">

            <!-- CONTAINER OPEN -->
            <div class="col col-login mx-auto">
                <div class="text-center">
                    <a><img src="{{ asset('assets/images/tkdn-bki.png') }}" style="width: 100px" class="header-brand-img" alt=""></a>
                </div>
            </div>

            <!-- CONTAINER OPEN -->
            <div class="container-login100">
                <div class="wrap-login100 p-6">
                    <form class="login100-form validate-form" method="POST" action="{{ route('password.email') }}">
                        @csrf
                        <span class="login100-form-title pb-5">
                            Forgot Password
                        </span>
                        <p class="text-muted">Enter the email address registered on your account</p>
                        <div class="wrap-input100 validate-input input-group" data-bs-validate="Valid email is required: ex@abc.xyz">
                            <a href="javascript:void(0)" class="input-group-text bg-white text-muted">
                                <i class="zmdi zmdi-email" aria-hidden="true"></i>
                            </a>
                            <x-input id="email" class="block mt-1 w-full" type="email" name="email" :value="old('email')" class="input100 border-start-0 ms-0 form-control" required autofocus />
                        </div>
                        <div class="container-login100-form-btn">
                            <button type="submit" class="login100-form-btn btn-primary">
                                Submit
                            </button>
                        </div>
                        {{-- <div class="text-center mt-4">
                                <p class="text-dark mb-0">Forgot It?<a class="text-primary ms-1" href="login.html">Send me Back</a></p>
                            </div> --}}
                    </form>
                </div>
            </div>
        </div>
    </div>
    <!--END PAGE -->
@endsection
