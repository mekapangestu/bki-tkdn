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
                <h1 class="page-title">View</h1>
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
            
            @include('partials.detail')
            
            <div class="row">
                <div class="col-12">
                    <div class="card custom-card">
                        <div class="card-header border-bottom">
                            <h3 class="card-title">Internal Document</h3>
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
                                        @foreach ($project->internal_files as $file)
                                            <tr>
                                                <td>{{ $loop->iteration }}</td>
                                                <td>{{ $file->label }}</td>
                                                <td>{{ $file->created_at }}</td>
                                                <td>{{ $file->updated_at }}</td>
                                                <td>
                                                    <a href="{{ asset('storage/' . $file->path) }}" target="_blank" class="btn text-primary btn-sm" data-bs-toggle="tooltip" data-bs-original-title="View"><span class="fe fe-eye fs-14"></span></a>
                                                    {{-- <a href="{{ route('delete.file', [$data->id, $file->label, $file->id]) }}" class="btn text-danger btn-sm" data-bs-toggle="tooltip" data-bs-original-title="Delete"><span class="fe fe-trash fs-14"></span></a> --}}
                                                </td>
                                            </tr>
                                        @endforeach
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
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
                                                        <td>{{ $file->label }}</td>
                                                        <td>{{ $file->created_at }}</td>
                                                        <td>{{ $file->updated_at }}</td>
                                                        <td>
                                                            <a href="{{ asset('storage/' . $file->path) }}" target="_blank" class="btn text-primary btn-sm" data-bs-toggle="tooltip" data-bs-original-title="View"><span class="fe fe-eye fs-14"></span></a>
                                                            {{-- <a href="{{ route('delete.file', [$data->id, $file->label, $file->id]) }}" class="btn text-danger btn-sm" data-bs-toggle="tooltip" data-bs-original-title="Delete"><span class="fe fe-trash fs-14"></span></a> --}}
                                                        </td>
                                                    </tr>
                                                @endif
                                            @endforeach
                                        </tbody>
                                    </table>
                                    <div class="card custom-card">
                                                <div class="card-header border-bottom">
                                                    <h3 class="card-title">Foto Produk</h3>
                                                </div>
                                                <div class="card-body">
                                                    <ul class="lightgallery list-unstyled row">
                                                        @foreach ($project->foto as $file)
                                                            @if ($item->id_produk == $file->id_produk)
                                                                <li class="col-xs-6 col-sm-4 col-md-4 col-xl-3 mb-5 border-bottom-0" data-responsive="{{ asset('storage/' . $file->path) }}" data-src="{{ asset('storage/' . $file->path) }}" data-sub-html="<h4>{{Str::headline($item->produk)}}</h4>">
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
                        </div>
                    @empty
                        <h4>Tidak ada produk</h4>
                    @endforelse
                </div>
            </div>
            <!-- CONTAINER END -->
        </div>
    </div>
@endsection
@section('js')
@endsection
