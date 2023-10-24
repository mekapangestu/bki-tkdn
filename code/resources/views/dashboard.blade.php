@extends('layouts.app')
@section('title', $title)
@section('content')
    <style>
        .leaflet-sidebar {
            bottom: 30px !important;
        }

        .leaflet-bottom.leaflet-right {
            position: absolute !important;
            right: 0 !important;
        }

        .context table {
            width: inherit !important;
        }

        .context table td,
        .context table th {
            white-space: nowrap;
            width: 1%;
            padding: 6px;
            margin: 0;
        }

        .leaflet-sidebar:not(.collapsed) {
            width: 50% !important;
            max-width: 50% !important;
        }
    </style>
    <div class="side-app">

        <!-- CONTAINER -->
        <div class="main-container container-fluid">

            <!-- PAGE-HEADER -->
            <div class="page-header">
                <h1 class="page-title">TKDN - {{ $title }}</h1>
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
                    <!-- ROW-1 -->
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xl-12">
                            <h5>Tahap 1</h5>
                            <div class="row">
                                <div class="col-lg-6 col-md-6 col-sm-12 col-xl-3">
                                    <a href="{{ route('projects.index') }}" style="all: unset;">
                                        <div class="card overflow-hidden">
                                            <div class="card-body">
                                                <div class="d-flex">
                                                    <div class="mt-2">
                                                        <h6 class="">Total Permohonan</h6>
                                                        <h2 class="mb-0 number-font">{{ $total }}</h2>
                                                    </div>
                                                    <div class="ms-auto">
                                                        <div class="chart-wrapper mt-1">
                                                            <canvas id="saleschart" class="h-8 w-9 chart-dropshadow"></canvas>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </a>
                                </div>
                                {{-- @role('superadmin|administrator|assessor|qc-officer|kepala-verifikasi')
                                <div class="col-lg-6 col-md-6 col-sm-12 col-xl-3">
                                    <div class="card overflow-hidden">
                                        <div class="card-body">
                                            <div class="d-flex">
                                                <div class="mt-2">
                                                    <h6 class="">Total Users</h6>
                                                    <h2 class="mb-0 number-font">{{ $users }}</h2>
                                                </div>
                                                <div class="ms-auto">
                                                    <div class="chart-wrapper mt-1">
                                                        <canvas id="profitchart" class="h-8 w-9 chart-dropshadow"></canvas>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                @endrole --}}
                            </div>
                            <br>
                            <h5>Tahap 2</h5>
                            <div class="row">
                                <div class="col-lg-6 col-md-6 col-sm-12 col-xl-3">
                                    <a href="{{ route('requests.index') }}" style="all: unset;">
                                        <div class="card overflow-hidden">
                                            <div class="card-body">
                                                <div class="d-flex">
                                                    <div class="mt-2">
                                                        <h6 class="">Total Permohonan Diterima</h6>
                                                        <h2 class="mb-0 number-font">{{ $accept }}</h2>
                                                    </div>
                                                    <div class="ms-auto">
                                                        <div class="chart-wrapper mt-1">
                                                            <canvas id="saleschart" class="h-8 w-9 chart-dropshadow"></canvas>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </a>
                                </div>
                                <div class="col-lg-6 col-md-6 col-sm-12 col-xl-3">
                                    <a href="{{ route('requests.index-tolak') }}" style="all: unset;">
                                        <div class="card overflow-hidden">
                                            <div class="card-body">
                                                <div class="d-flex">
                                                    <div class="mt-2">
                                                        <h6 class="">Total Permohonan Ditolak</h6>
                                                        <h2 class="mb-0 number-font">{{ $denied }}</h2>
                                                    </div>
                                                    <div class="ms-auto">
                                                        <div class="chart-wrapper mt-1">
                                                            <canvas id="leadschart" class="h-8 w-9 chart-dropshadow"></canvas>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </a>
                                </div>
                                <div class="col-lg-6 col-md-6 col-sm-12 col-xl-3">
                                    <a href="{{ route('requests.index') }}" style="all: unset;">
                                        <div class="card overflow-hidden">
                                            <div class="card-body">
                                                <div class="d-flex">
                                                    <div class="mt-2">
                                                        <h6 class="">Total Permohonan Diterima Menunggu Verifikasi Dokumen</h6>
                                                        <h2 class="mb-0 number-font">{{ $incomplete }}</h2>
                                                    </div>
                                                    <div class="ms-auto">
                                                        <div class="chart-wrapper mt-1">
                                                            <canvas id="profitchart" class="h-8 w-9 chart-dropshadow"></canvas>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </a>
                                </div>
                                <div class="col-lg-6 col-md-6 col-sm-12 col-xl-3">
                                    <a href="{{ route('requests.index') }}" style="all: unset;">
                                        <div class="card overflow-hidden">
                                            <div class="card-body">
                                                <div class="d-flex">
                                                    <div class="mt-2">
                                                        <h6 class="">Total Permohonan Freeze</h6>
                                                        <h2 class="mb-0 number-font">{{ $freeze }}</h2>
                                                    </div>
                                                    <div class="ms-auto">
                                                        <div class="chart-wrapper mt-1">
                                                            <canvas id="profitchart" class="h-8 w-9 chart-dropshadow"></canvas>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </a>
                                </div>
                                <div class="col-lg-6 col-md-6 col-sm-12 col-xl-3">
                                    <a href="{{ route('requests.index') }}" style="all: unset;">
                                        <div class="card overflow-hidden">
                                            <div class="card-body">
                                                <div class="d-flex">
                                                    <div class="mt-2">
                                                        <h6 class="">Total Permohonan Pengembalian Dokumen</h6>
                                                        <h2 class="mb-0 number-font">{{ $return }}</h2>
                                                    </div>
                                                    <div class="ms-auto">
                                                        <div class="chart-wrapper mt-1">
                                                            <canvas id="profitchart" class="h-8 w-9 chart-dropshadow"></canvas>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </a>
                                </div>
                            </div>
                            <br>
                            <h5>Tahap 3</h5>
                            <div class="row">
                                <div class="col-lg-6 col-md-6 col-sm-12 col-xl-3">
                                    <a href="{{ route('projects.index') }}" style="all: unset;">
                                        <div class="card overflow-hidden">
                                            <div class="card-body">
                                                <div class="d-flex">
                                                    <div class="mt-2">
                                                        <h6 class="">Total Verifikasi Lapangan</h6>
                                                        <h2 class="mb-0 number-font">{{ $stage3 }}</h2>
                                                    </div>
                                                    <div class="ms-auto">
                                                        <div class="chart-wrapper mt-1">
                                                            <canvas id="saleschart" class="h-8 w-9 chart-dropshadow"></canvas>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </a>
                                </div>
                            </div>
                            <br>
                            <h5>Tahap 4</h5>
                            <div class="row">
                                <div class="col-lg-6 col-md-6 col-sm-12 col-xl-3">
                                    <a href="{{ route('projects.index') }}" style="all: unset;">
                                        <div class="card overflow-hidden">
                                            <div class="card-body">
                                                <div class="d-flex">
                                                    <div class="mt-2">
                                                        <h6 class="">Total QC</h6>
                                                        <h2 class="mb-0 number-font">{{ $stage4 }}</h2>
                                                    </div>
                                                    <div class="ms-auto">
                                                        <div class="chart-wrapper mt-1">
                                                            <canvas id="saleschart" class="h-8 w-9 chart-dropshadow"></canvas>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </a>
                                </div>
                            </div>
                            <br>
                            <h5>Tahap 5</h5>
                            <div class="row">
                                <div class="col-lg-6 col-md-6 col-sm-12 col-xl-3">
                                    <a href="{{ route('projects.persetujuan') }}" style="all: unset;">
                                        <div class="card overflow-hidden">
                                            <div class="card-body">
                                                <div class="d-flex">
                                                    <div class="mt-2">
                                                        <h6 class="">Total Persetujuan Pemohon</h6>
                                                        <h2 class="mb-0 number-font">{{ $stage5 }}</h2>
                                                    </div>
                                                    <div class="ms-auto">
                                                        <div class="chart-wrapper mt-1">
                                                            <canvas id="saleschart" class="h-8 w-9 chart-dropshadow"></canvas>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </a>
                                </div>
                            </div>
                            <br>
                            <h5>Tahap 6</h5>
                            <div class="row">
                                <div class="col-lg-6 col-md-6 col-sm-12 col-xl-3">
                                    <a href="{{ route('projects.tracking') }}" style="all: unset;">
                                        <div class="card overflow-hidden">
                                            <div class="card-body">
                                                <div class="d-flex">
                                                    <div class="mt-2">
                                                        <h6 class="">Total Pembuatan Surat Pengantar</h6>
                                                        <h2 class="mb-0 number-font">{{ $stage6 }}</h2>
                                                    </div>
                                                    <div class="ms-auto">
                                                        <div class="chart-wrapper mt-1">
                                                            <canvas id="saleschart" class="h-8 w-9 chart-dropshadow"></canvas>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </a>
                                </div>
                            </div>
                            <br>
                            <h5>Tahap 7</h5>
                            <div class="row">
                                <div class="col-lg-6 col-md-6 col-sm-12 col-xl-3">
                                    <a href="{{ route('projects.tracking') }}" style="all: unset;">
                                        <div class="card overflow-hidden">
                                            <div class="card-body">
                                                <div class="d-flex">
                                                    <div class="mt-2">
                                                        <h6 class="">Total Review Kesesuaian Dokumen Oleh Pusat P3DN</h6>
                                                        <h2 class="mb-0 number-font">{{ $stage7 }}</h2>
                                                    </div>
                                                    <div class="ms-auto">
                                                        <div class="chart-wrapper mt-1">
                                                            <canvas id="saleschart" class="h-8 w-9 chart-dropshadow"></canvas>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </a>
                                </div>
                            </div>
                            <br>
                            <h5>Tahap 8</h5>
                            <div class="row">
                                <div class="col-lg-6 col-md-6 col-sm-12 col-xl-3">
                                    <a href="{{ route('projects.tracking') }}" style="all: unset;">
                                        <div class="card overflow-hidden">
                                            <div class="card-body">
                                                <div class="d-flex">
                                                    <div class="mt-2">
                                                        <h6 class="">Total Penetapan Jadwal Review</h6>
                                                        <h2 class="mb-0 number-font">{{ $stage8 }}</h2>
                                                    </div>
                                                    <div class="ms-auto">
                                                        <div class="chart-wrapper mt-1">
                                                            <canvas id="saleschart" class="h-8 w-9 chart-dropshadow"></canvas>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </a>
                                </div>
                            </div>
                            <br>
                            <h5>Tahap 9</h5>
                            <div class="row">
                                <div class="col-lg-6 col-md-6 col-sm-12 col-xl-3">
                                    <a href="{{ route('projects.tracking') }}" style="all: unset;">
                                        <div class="card overflow-hidden">
                                            <div class="card-body">
                                                <div class="d-flex">
                                                    <div class="mt-2">
                                                        <h6 class="">Total Review Oleh Pusat P3DN dan LVI</h6>
                                                        <h2 class="mb-0 number-font">{{ $stage9 }}</h2>
                                                    </div>
                                                    <div class="ms-auto">
                                                        <div class="chart-wrapper mt-1">
                                                            <canvas id="saleschart" class="h-8 w-9 chart-dropshadow"></canvas>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </a>
                                </div>
                            </div>
                            <br>
                            <h5>Tahap 10</h5>
                            <div class="row">
                                <div class="col-lg-6 col-md-6 col-sm-12 col-xl-3">
                                    <a href="{{ route('projects.tracking') }}" style="all: unset;">
                                        <div class="card overflow-hidden">
                                            <div class="card-body">
                                                <div class="d-flex">
                                                    <div class="mt-2">
                                                        <h6 class="">Total Proses Sanggah</h6>
                                                        <h2 class="mb-0 number-font">{{ $stage10 }}</h2>
                                                    </div>
                                                    <div class="ms-auto">
                                                        <div class="chart-wrapper mt-1">
                                                            <canvas id="saleschart" class="h-8 w-9 chart-dropshadow"></canvas>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </a>
                                </div>
                            </div>
                            <br>
                            <h5>Tahap 11</h5>
                            <div class="row">
                                <div class="col-lg-6 col-md-6 col-sm-12 col-xl-3">
                                    <a href="{{ route('projects.tracking') }}" style="all: unset;">
                                        <div class="card overflow-hidden">
                                            <div class="card-body">
                                                <div class="d-flex">
                                                    <div class="mt-2">
                                                        <h6 class="">Total Review Setelah Sanggah</h6>
                                                        <h2 class="mb-0 number-font">{{ $stage11 }}</h2>
                                                    </div>
                                                    <div class="ms-auto">
                                                        <div class="chart-wrapper mt-1">
                                                            <canvas id="saleschart" class="h-8 w-9 chart-dropshadow"></canvas>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </a>
                                </div>
                            </div>
                            <br>
                            <h5>Tahap 12</h5>
                            <div class="row">
                                <div class="col-lg-6 col-md-6 col-sm-12 col-xl-3">
                                    <a href="{{ route('projects.terbit') }}" style="all: unset;">
                                    <div class="card overflow-hidden">
                                        <div class="card-body">
                                            <div class="d-flex">
                                                <div class="mt-2">
                                                    <h6 class="">Total Terbit Sertifikat</h6>
                                                    <h2 class="mb-0 number-font">{{ $terbit }}</h2>
                                                </div>
                                                <div class="ms-auto">
                                                    <div class="chart-wrapper mt-1">
                                                        <canvas id="saleschart" class="h-8 w-9 chart-dropshadow"></canvas>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    </a>
                                </div>
                                <div class="col-lg-6 col-md-6 col-sm-12 col-xl-3">
                                    <a href="{{ route('projects.terbit') }}" style="all: unset;">
                                    <div class="card overflow-hidden">
                                        <div class="card-body">
                                            <div class="d-flex">
                                                <div class="mt-2">
                                                    <h6 class="">Total Pelunasan Pemohon</h6>
                                                    <h2 class="mb-0 number-font">{{ $lunas }}</h2>
                                                </div>
                                                <div class="ms-auto">
                                                    <div class="chart-wrapper mt-1">
                                                        <canvas id="saleschart" class="h-8 w-9 chart-dropshadow"></canvas>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    </a>
                                </div>
                            </div>
                            <br>
                        </div>
                    </div>
                    <!-- ROW-1 END -->
                </div>
            </div>
            <!-- CONTAINER END -->
        </div>
    @endsection
    @section('js')
        <script src="{{ asset('assets/plugins/leaflet/leaflet.js') }}"></script>
        <script src='https://cdn.jsdelivr.net/npm/leaflet-sidebar-v2@3.1.1/js/leaflet-sidebar.min.js'></script>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/leaflet-sidebar-v2@3.1.1/css/leaflet-sidebar.min.css">
    @endsection
