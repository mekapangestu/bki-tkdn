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
                <h1 class="page-title">{{ $title }}</h1>
                <div>
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="javascript:void(0)">Home</a></li>
                        <li class="breadcrumb-item active" aria-current="page">{{ $title }}</li>
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
                    @include('partials.detail')
                </div>
            </div>
            <div class="row">
                <div class="col-12">
                    <div class="card">
                        <div class="card-header">
                            <h3 class="card-title">Data Produk</h3>
                        </div>
                        <div class="card-body">
                            <form method="POST" action="{{ route('projects.verify-tkdn-submit', $project->id) }}" enctype="multipart/form-data">
                                @csrf
                                <input type="hidden" name="project_id" value="{{ $project->id }}" readonly>
                                @forelse ($project->orders->siinas_data->produk ?? [] as $item)
                                    <div class="card custom-card">
                                        <div class="card-header border-bottom">
                                            <h3 class="card-title">{{ Str::headline($item->produk) }} Document</h3>
                                        </div>
                                        <div class="card-body">
                                            <div class="">
                                                <table id="example2" class="table table-bordered text-nowrap border-bottom text-center">
                                                    <thead>
                                                        <tr>
                                                            <th class="border-bottom-0" style="width: 25px">No</th>
                                                            <th class="border-bottom-0">File Name</th>
                                                            <th class="border-bottom-0">Created At</th>
                                                            <th class="border-bottom-0">Updated At</th>
                                                            <th class="border-bottom-0" style="width: 50px">Action</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        @foreach ($project->files as $file)
                                                            @if ($item->id_produk == $file->id_produk)
                                                                <tr>
                                                                    <td>{{ $loop->iteration }}</td>
                                                                    <td>{{ Str::swap(
                                                                        [
                                                                            Str::title($item->produk) . '-' => '',
                                                                        ],
                                                                        $file->label,
                                                                    ) }}</td>
                                                                    <td>{{ $file->created_at }}</td>
                                                                    <td>{{ $file->updated_at }}</td>
                                                                    <td>
                                                                        <a href="{{ asset('storage/' . $file->path) }}" target="_blank" class="btn text-primary btn-sm" data-bs-toggle="tooltip" data-bs-original-title="View"><span class="fe fe-eye fs-14"></span></a>
                                                                        {{-- <a href="{{ route('delete.file', [$project->id, $file->label, $file->id]) }}" class="btn text-danger btn-sm" data-bs-toggle="tooltip" data-bs-original-title="Delete"><span class="fe fe-trash fs-14"></span></a> --}}
                                                                    </td>
                                                                </tr>
                                                            @endif
                                                        @endforeach
                                                    </tbody>
                                                </table>
                                            </div>
                                            @forelse ($project->tkdn as $tkdn)
                                                @if ($tkdn->id_produk == $item->id_produk)
                                                    <div class="row col-12">
                                                        <div class="col-8">
                                                            <input type="hidden" name="id_produk[{{ $item->produk }}]" value="{{ $item->id_produk }}">
                                                            <div class="row">
                                                                <h4><strong>Hasil Perhitungan TKDN</strong></h4>
                                                                <div class="col-xl-4 col-md-4 col-sm-4">
                                                                    <div class="form-group">
                                                                        <label for="spk_no" class="form-label">Nilai TKDN</label>
                                                                        <input type="text" class="form-control" id="spk_no" autocomplete="off" name="nilai_tkdn" value="{{ $tkdn?->nilai_tkdn }}" disabled>
                                                                    </div>
                                                                </div>
                                                                <div class="col-xl-4 col-md-4 col-sm-4">
                                                                    <div class="form-group">
                                                                        <label for="spk_no" class="form-label">Nilai TKDN Jasa</label>
                                                                        <input type="text" class="form-control" id="spk_no" autocomplete="off" name="nilai_tkdn_jasa" value="{{ $tkdn?->nilai_tkdn_jasa }}" disabled>
                                                                    </div>
                                                                </div>
                                                                <div class="col-xl-4 col-md-4 col-sm-4">
                                                                    <div class="form-group">
                                                                        <label for="spk_no" class="form-label">Nilai TKDN Gabungan</label>
                                                                        <input type="text" class="form-control" id="spk_no" autocomplete="off" name="nilai_tkdn_gabungan" value="{{ $tkdn?->nilai_tkdn_gabungan }}" disabled>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-4">
                                                            <div class="card custom-card">
                                                                <div class="card-header border-bottom">
                                                                    <h3 class="card-title">Foto Produk</h3>
                                                                </div>
                                                                <div class="card-body">
                                                                    <ul class="lightgallery list-unstyled row">
                                                                        @foreach ($project->foto as $file)
                                                                            @if ($item->id_produk == $file->id_produk)
                                                                                <li class="col-xs-6 col-sm-4 col-md-4 col-xl-3 mb-5 border-bottom-0" data-responsive="{{ asset('storage/' . $file->path) }}" data-src="{{ asset('storage/' . $file->path) }}" data-sub-html="<h4>{{ Str::headline($item->produk) }}</h4>">
                                                                                    <a href="javascript:void(0)">
                                                                                        <img class="img-responsive br-5" src="{{ asset('storage/' . $file->path) }}">
                                                                                    </a>
                                                                                </li>
                                                                            @endif
                                                                        @endforeach
                                                                    </ul>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                @endif
                                            @empty
                                                <tr>
                                                    <td colspan="3">Tidak ada produk.</td>
                                                </tr>
                                            @endforelse
                                        </div>
                                    </div>
                                @empty
                                    <h4>Tidak ada produk</h4>
                                @endforelse
                                @role('superadmin|administrator')
                                    <button type="submit" name="action" onclick="siinasSubmit(1)" value="1" class="btn btn-success mt-4 mb-0">Sesuai</button>
                                    {{-- <button type="submit" name="action" value="0" class="btn btn-primary mt-4 mb-0">Tidak Sesuai</button> --}}
                                @endrole
                                @role('kepala-verifikasi')
                                    <button type="submit" name="action" value="1" class="btn btn-success mt-4 mb-0">Sesuai</button>
                                    <button type="submit" name="action" value="0" class="btn btn-primary mt-4 mb-0">Tidak Sesuai</button>
                                @endrole
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
