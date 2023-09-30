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
                <h1 class="page-title">TKDN - Project</h1>
                <div>
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="javascript:void(0)">Home</a></li>
                        <li class="breadcrumb-item active" aria-current="page">Project</li>
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
                            <table id="basic-datatable" class="table table-bordered text-wrap key-buttons border-bottom text-center datatable">
                                <thead>
                                    <tr>
                                        <th class="border-bottom-0 filter">NIB</th>
                                        <th class="border-bottom-0 filter">NPWP</th>
                                        <th class="border-bottom-0 filter">Kode Produk</th>
                                        <th class="border-bottom-0 filter">Nama CP</th>
                                        <th class="border-bottom-0 filter">Jabatan CP</th>
                                        <th class="border-bottom-0 filter">Status Asesor</th>
                                        <th class="border-bottom-0 filter">Catatan Asesor</th>
                                        <th class="border-bottom-0 filter">Status QC</th>
                                        <th class="border-bottom-0 filter">Catatan QC</th>
                                        <th class="border-bottom-0 filter">Status</th>
                                        {{-- <th class="border-bottom-0 filter">Last Activity</th> --}}
                                        <th class="border-bottom-0" style="width: 25px">Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    @foreach ($data as $item)
                                    <tr>
                                        <td>{{ $item->nib }}</td>
                                        <td>{{ $item->npwp }}</td>
                                        <td>{{ $item->kd_produk }}</td>
                                        <td>{{ $item->nama_cp }}</td>
                                        <td>{{ $item->jabatan_cp }}</td>
                                        {{-- <td>{{ $item->data?->statusAsesor->name ?? '-' }}</td> --}}
                                        <td>
                                            @forelse ($item->asesors as $asesor)
                                                {{$asesor->user->name. ' : ' .$asesor->statusAsesor?->name ?? '-'}}
                                                <br>
                                            @empty
                                                -
                                            @endforelse
                                        </td>
                                        <td>
                                            @forelse ($item->asesors as $asesor)
                                                {{$asesor->user->name. ' : ' .$asesor->asesor_note ?? '-'}}
                                                <br>
                                            @empty
                                                -
                                            @endforelse
                                        </td>
                                        {{-- <td>{{ $item->data?->asesor_note ?? '-' }}</td> --}}
                                        <td>{{ $item->qc?->statusQc->name ?? '-' }}</td>
                                        <td>{{ $item->qc?->qc_note ?? '-' }}</td>
                                        <td>{{ $item->statuses?->name ?? '-' }}</td>
                                        {{-- <td style="text-align: left;">
                                            @forelse (json_decode($item->logs?->last()?->payload ?? '[]') as $key => $val)
                                                {{$key . ' = ' . json_encode($val)}}<br>
                                            @empty
                                                -
                                            @endforelse
                                        </td> --}}
                                        <td>
                                            @role('superadmin|administrator')
                                            <div class="dropdown">
                                                <button class="btn btn-light btn-sm dropdown-toggle" type="button" id="dropdownMenu" data-bs-toggle="dropdown" aria-expanded="false">
                                                    <span class="fe fe-more-horizontal fs-14"></span>
                                                </button>
                                                <ul class="dropdown-menu" aria-labelledby="dropdownMenu">
                                                    @if ($item->stage == 9)
                                                        <li class=""><a href="{{ route('projects.surat-jawaban', $item->id) }}" class="btn text-primary btn-sm"      data-bs-toggle="tooltip" data-bs-original-title="Selesai"><span class="fe fe-edit fs-14"></span> Upload Surat Jawaban</a></li>
                                                    @elseif ($item->stage == 5)
                                                        <li class=""><a href="{{ route('projects.surat-pengantar', $item->id) }}" class="btn text-primary btn-sm"      data-bs-toggle="tooltip" data-bs-original-title="Selesai"><span class="fe fe-edit fs-14"></span> Upload Surat Pengantar</a></li>
                                                    @elseif ($item->stage == 2 && $item->kepala?->kepala_status != 1)
                                                        <li class=""><a href="{{ route('projects.draf', $item->id) }}" class="btn text-primary btn-sm" data-bs-toggle="tooltip" data-bs-original-title="Selesai"><span class="fe fe-edit fs-14"></span> View Draf</a></li>
                                                    @elseif ($item->kepala?->kepala_status == 1)
                                                        <li><a href="{{route('projects.verify-tkdn', $item->id)}}" class="btn text-primary btn-sm" data-bs-toggle="tooltip" data-bs-original-title="View"><span class="fe fe-eye fs-14"></span> Cek Hasil QC & Draft Persetujuan</a></li>
                                                    @elseif ($item->data && $item->status == 2)
                                                        <li class=""><a href="{{ route('projects.submit', [$item->id, 1]) }}" class="btn text-primary btn-sm" data-bs-toggle="tooltip" data-bs-original-title="Selesai"><span class="fe fe-edit fs-14"></span> Terima</a></li>
                                                        {{-- <li class=""><a href="{{ route('projects.submit', [$item->id, 2]) }}" class="btn text-secondary btn-sm" data-bs-toggle="tooltip" data-bs-original-title="Diterima"><span class="fe fe-edit fs-14"></span> Terima Tidak Lengkap</a></li> --}}
                                                        <li class=""><a href="{{ route('projects.submit', [$item->id, 0]) }}" class="btn text-danger btn-sm" data-bs-toggle="tooltip" data-bs-original-title="Ditolak"><span class="fe fe-edit fs-14"></span> Ditolak</a></li>
                                                        <li><a href="{{ route('projects.submit', [$item->id, 3]) }}" class="btn text-warning btn-sm" data-bs-toggle="tooltip" data-bs-original-title="View"><span class="fe fe-eye fs-14"></span> Freeze, Tak Lengkap</a></li>
                                                    @elseif($item->stage == 1 && $item->status == 2)
                                                        <li><a href="{{route('projects.show', $item->id)}}" class="btn text-primary btn-sm" data-bs-toggle="tooltip" data-bs-original-title="View"><span class="fe fe-eye fs-14"></span> Pilih Asesor & QC</a></li>
                                                    @elseif($item->stage == 1 && $item->status == null)
                                                        <li><a href="{{route('projects.verify-admin', $item->id)}}" class="btn text-primary btn-sm" data-bs-toggle="tooltip" data-bs-original-title="View"><span class="fe fe-eye fs-14"></span> View Data</a></li>
                                                    @endif
                                                    <li><a href="{{route('projects.detail', $item->id)}}" class="btn text-primary btn-sm" data-bs-toggle="tooltip" data-bs-original-title="View"><span class="fe fe-eye fs-14"></span> Detail</a></li>

                                                </ul>
                                            </div>
                                            @endrole
                                            @role('guest')
                                            <div class="dropdown">
                                                <button class="btn btn-light btn-sm dropdown-toggle" type="button" id="dropdownMenu" data-bs-toggle="dropdown" aria-expanded="false">
                                                    <span class="fe fe-more-horizontal fs-14"></span>
                                                </button>
                                                {{-- @if ($item->url_sertifikat_terbit)
                                                    <ul class="dropdown-menu" aria-labelledby="dropdownMenu">
                                                        <li><a href="{{url($item->url_sertifikat_terbit)}}" class="btn text-primary btn-sm" data-bs-toggle="tooltip" data-bs-original-title="View" target="_blank"><span class="fe fe-eye fs-14"></span> View Sertifikat</a></li>
                                                    </ul>
                                                @endif --}}

                                                <ul class="dropdown-menu" aria-labelledby="dropdownMenu">
                                                    <li><a href="{{route('projects.edit', $item->id)}}" class="btn text-primary btn-sm" data-bs-toggle="tooltip" data-bs-original-title="View"><span class="fe fe-eye fs-14"></span> Lengkapi Data</a></li>
                                                </ul>
                                            </div>
                                            @endrole
                                            @role('assessor')
                                            <div class="dropdown">
                                                <button class="btn btn-light btn-sm dropdown-toggle" type="button" id="dropdownMenu" data-bs-toggle="dropdown" aria-expanded="false">
                                                    <span class="fe fe-more-horizontal fs-14"></span>
                                                </button>
                                                @if ($item->stage == 2)
                                                    <ul class="dropdown-menu" aria-labelledby="dropdownMenu">
                                                        <li><a href="{{route('projects.verify2', $item->id)}}" class="btn text-primary btn-sm" data-bs-toggle="tooltip" data-bs-original-title="View"><span class="fe fe-eye fs-14"></span> Upload Draf</a></li>
                                                    </ul>
                                                @elseif($item->stage == 1)
                                                    <ul class="dropdown-menu" aria-labelledby="dropdownMenu">
                                                        <li><a href="{{route('projects.verify', $item->id)}}" class="btn text-primary btn-sm" data-bs-toggle="tooltip" data-bs-original-title="View"><span class="fe fe-eye fs-14"></span> Verifikasi Data</a></li>
                                                    </ul>
                                                @else
                                                    <ul class="dropdown-menu" aria-labelledby="dropdownMenu">
                                                        <li><a href="{{route('projects.view', $item->id)}}" class="btn text-primary btn-sm" data-bs-toggle="tooltip" data-bs-original-title="View"><span class="fe fe-eye fs-14"></span> View Data</a></li>
                                                    </ul>
                                                @endif
                                            </div>
                                            @endrole
                                            @role('qc-officer')
                                            <div class="dropdown">
                                                <button class="btn btn-light btn-sm dropdown-toggle" type="button" id="dropdownMenu" data-bs-toggle="dropdown" aria-expanded="false">
                                                    <span class="fe fe-more-horizontal fs-14"></span>
                                                </button>
                                                <ul class="dropdown-menu" aria-labelledby="dropdownMenu">
                                                    <li><a href="{{route('projects.tkdn', $item->id)}}" class="btn text-primary btn-sm" data-bs-toggle="tooltip" data-bs-original-title="View"><span class="fe fe-eye fs-14"></span> Input Perhitungan TKDN</a></li>
                                                </ul>
                                            </div>
                                            @endrole
                                            @role('kepala-verifikasi')
                                            <div class="dropdown">
                                                <button class="btn btn-light btn-sm dropdown-toggle" type="button" id="dropdownMenu" data-bs-toggle="dropdown" aria-expanded="false">
                                                    <span class="fe fe-more-horizontal fs-14"></span>
                                                </button>
                                                <ul class="dropdown-menu" aria-labelledby="dropdownMenu">
                                                    <li><a href="{{route('projects.verify-tkdn', $item->id)}}" class="btn text-primary btn-sm" data-bs-toggle="tooltip" data-bs-original-title="View"><span class="fe fe-eye fs-14"></span> Cek Hasil QC & Draft Persetujuan</a></li>
                                                </ul>
                                            </div>
                                            @endrole
                                        </td>
                                    </tr>
                                    @endforeach
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        <!-- CONTAINER END -->
    </div>
@endsection
@section('js')
<script src="{{asset('assets/plugins/leaflet/leaflet.js')}}"></script>
<script src='https://cdn.jsdelivr.net/npm/leaflet-sidebar-v2@3.1.1/js/leaflet-sidebar.min.js'></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/leaflet-sidebar-v2@3.1.1/css/leaflet-sidebar.min.css">
@endsection