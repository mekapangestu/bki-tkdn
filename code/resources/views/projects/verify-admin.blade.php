@extends('layouts.app')
@section('title', 'Dashboard')
@section('content')
<style>
    .leaflet-sidebar{
       bottom: 30px!important; 
    }
    .leaflet-bottom.leaflet-right{
        position: absolute!important;
        right: 0!important;
    }
    .context table { width: inherit !important; }
    .context table td, 
    .context table th{
        white-space: nowrap;
        width: 1%;
        padding: 6px;
        margin: 0;
    }
    .leaflet-sidebar:not(.collapsed) {
        width: 50%!important;
        max-width: 50%!important;
    }
</style>
    <div class="side-app">

        <!-- CONTAINER -->
        <div class="main-container container-fluid">

            <!-- PAGE-HEADER -->
            <div class="page-header">
                <h1 class="page-title">Verifikasi</h1>
                <div>
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="javascript:void(0)">Home</a></li>
                        <li class="breadcrumb-item active" aria-current="page">Dashboard</li>
                    </ol>
                </div>
            </div>
            <!-- PAGE-HEADER END -->
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
            <div class="row">
                <div class="col-12">
                    <div class="card">
                        <div class="card-header">
                            <h3 class="card-title">Data</h3>
                        </div>
                        <div class="card-body">
                            <form method="POST" action="{{ route('projects.verify-admin-submit', $data->id) }}" enctype="multipart/form-data">
                                @csrf
                                <input type="hidden" name="project_id" value="{{ $data->id }}" readonly>
                                <div class="row">
                                    <div class="col-xl-12 col-md-12 col-sm-12">
                                        <div class="form-group">
                                            <label for="spk_no" class="form-label">NIB</label>
                                            <input type="text" class="form-control" id="spk_no" autocomplete="off" name="spk_no" placeholder="Enter SPK Number" value="{{$data->nib}}" disabled>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-xl-12 col-md-12 col-sm-12">
                                        <div class="form-group">
                                            <label for="spk_no" class="form-label">NPWP</label>
                                            <input type="text" class="form-control" id="spk_no" autocomplete="off" name="spk_no" placeholder="Enter SPK Number" value="{{$data->npwp}}" disabled>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-xl-12 col-md-12 col-sm-12">
                                        <div class="form-group">
                                            <label for="spk_no" class="form-label">Kode Produk</label>
                                            <input type="text" class="form-control" id="spk_no" autocomplete="off" name="spk_no" placeholder="Enter SPK Number" value="{{$data->kd_produk}}" disabled>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-xl-12 col-md-12 col-sm-12">
                                        <div class="form-group">
                                            <label for="spk_no" class="form-label">Nama CP</label>
                                            <input type="text" class="form-control" id="spk_no" autocomplete="off" name="spk_no" placeholder="Enter SPK Number" value="{{$data->nama_cp}}" disabled>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-xl-12 col-md-12 col-sm-12">
                                        <div class="form-group">
                                            <label for="spk_no" class="form-label">Jabatan CP</label>
                                            <input type="text" class="form-control" id="spk_no" autocomplete="off" name="spk_no" placeholder="Enter SPK Number" value="{{$data->jabatan_cp}}" disabled>
                                        </div>
                                    </div>
                                </div>
                                <button type="submit" name="action" value="1" class="btn btn-primary mt-4 mb-0">Terima</button>
                                <button type="submit" name="action" value="2" class="btn btn-success mt-4 mb-0">Terima Tidak Lengkap</button>
                                <button type="submit" name="action" value="0" class="btn btn-danger mt-4 mb-0">Tolak</button>
                                <button type="submit" name="action" value="3" class="btn btn-warning mt-4 mb-0">Freeze/Pending</button>
                                <a href="{{ route('dashboard') }}" class="btn btn-secondary mt-4 mb-0">Back</a>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        <!-- CONTAINER END -->
    </div>
@endsection
@section('js')
@endsection