@extends('layouts.app')
@section('title', 'Dashboard')
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
            <div class="row">
                <div class="col-12">
                    <div class="card">
                        <div class="card-header">
                            <h3 class="card-title">Data Permohonan</h3>
                        </div>
                        <div class="card-body">
                            <div class="row">
                                <div class="col-6">
                                    <div class="col-xl-12 col-md-12 col-sm-12">
                                        <div class="form-group">
                                            <label for="spk_no" class="form-label">NIB</label>
                                            <input type="text" class="form-control" id="spk_no" autocomplete="off" name="spk_no" value="{{ $data->nib }}" disabled>
                                        </div>
                                    </div>

                                    <div class="col-xl-12 col-md-12 col-sm-12">
                                        <div class="form-group">
                                            <label for="spk_no" class="form-label">NPWP</label>
                                            <input type="text" class="form-control" id="spk_no" autocomplete="off" name="spk_no" value="{{ $data->npwp }}" disabled>
                                        </div>
                                    </div>
                                    <div class="col-xl-12 col-md-12 col-sm-12">
                                        <div class="form-group">
                                            <label for="spk_no" class="form-label">Nama Perusahaan</label>
                                            <input type="text" class="form-control" autocomplete="off" name="spk_no" value="{{ $data->nama_perusahaan }}" disabled>
                                        </div>
                                    </div>
                                    <div class="col-xl-12 col-md-12 col-sm-12">
                                        <div class="form-group">
                                            <label for="spk_no" class="form-label">Kode Produk</label>
                                            <input type="text" class="form-control" id="spk_no" autocomplete="off" name="spk_no" value="{{ $data->kd_produk }}" disabled>
                                        </div>
                                    </div>

                                    <div class="col-xl-12 col-md-12 col-sm-12">
                                        <div class="form-group">
                                            <label for="spk_no" class="form-label">Nomer Berkas</label>
                                            <input type="text" class="form-control" id="spk_no" autocomplete="off" name="spk_no" value="{{ $data->no_berkas }}" disabled>
                                        </div>
                                    </div>

                                    <div class="col-xl-12 col-md-12 col-sm-12">
                                        <div class="form-group">
                                            <label for="spk_no" class="form-label">Alamat Kantor</label>
                                            <input type="text" class="form-control" id="spk_no" autocomplete="off" name="spk_no" value="{{ $data->alamat_kantor }}" disabled>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-6">
                                    <div class="col-xl-12 col-md-12 col-sm-12">
                                        <div class="form-group">
                                            <label for="spk_no" class="form-label">Nama CP</label>
                                            <input type="text" class="form-control" id="spk_no" autocomplete="off" name="spk_no" value="{{ $data->nama_cp }}" disabled>
                                        </div>
                                    </div>

                                    <div class="col-xl-12 col-md-12 col-sm-12">
                                        <div class="form-group">
                                            <label for="spk_no" class="form-label">No HP CP</label>
                                            <input type="text" class="form-control" id="spk_no" autocomplete="off" name="spk_no" value="{{ $data->no_hp_cp }}" disabled>
                                        </div>
                                    </div>

                                    <div class="col-xl-12 col-md-12 col-sm-12">
                                        <div class="form-group">
                                            <label for="spk_no" class="form-label">Email CP</label>
                                            <input type="text" class="form-control" id="spk_no" autocomplete="off" name="spk_no" value="{{ $data->email_cp }}" disabled>
                                        </div>
                                    </div>

                                    <div class="col-xl-12 col-md-12 col-sm-12">
                                        <div class="form-group">
                                            <label for="spk_no" class="form-label">Jabatan CP</label>
                                            <input type="text" class="form-control" id="spk_no" autocomplete="off" name="spk_no" value="{{ $data->jabatan_cp }}" disabled>
                                        </div>
                                    </div>

                                    <div class="col-xl-12 col-md-12 col-sm-12">
                                        <div class="form-group">
                                            <label for="spk_no" class="form-label">Alamat Pabrik</label>
                                            <input type="text" class="form-control" id="spk_no" autocomplete="off" name="spk_no" value="{{ $data->alamat_pabrik }}" disabled>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <nav>
                                <div class="nav nav-tabs" id="nav-tab" role="tablist" style="padding: 25px;">
                                    <button class="nav-link active" data-bs-toggle="tab" data-bs-target="#collapseProduk" type="button" role="tab" aria-controls="collapseProduk" aria-selected="true">Produk</button>
                                    <button class="nav-link" data-bs-toggle="tab" data-bs-target="#collapseMesin" type="button" role="tab" aria-controls="collapseMesin" aria-selected="false">Mesin</button>
                                    <button class="nav-link" data-bs-toggle="tab" data-bs-target="#collapseNaker" type="button" role="tab" aria-controls="collapseNaker" aria-selected="false">Tenaga Kerja</button>
                                    <button class="nav-link" data-bs-toggle="tab" data-bs-target="#collapseProduksi" type="button" role="tab" aria-controls="collapseProduksi" aria-selected="false">Produksi</button>
                                    <button class="nav-link" data-bs-toggle="tab" data-bs-target="#collapseKapasitas" type="button" role="tab" aria-controls="collapseKapasitas" aria-selected="false">Kapasitas</button>
                                    <button class="nav-link" data-bs-toggle="tab" data-bs-target="#collapseBahanBaku" type="button" role="tab" aria-controls="collapseBahanBaku" aria-selected="false">Bahan Baku</button>
                                    <button class="nav-link" data-bs-toggle="tab" data-bs-target="#collapseBahanPenolong" type="button" role="tab" aria-controls="collapseBahanPenolong" aria-selected="false">Bahan Penolong</button>
                                </div>
                            </nav>
                            <div class="tab-content" id="nav-tabContent">
                                <div class="tab-pane fade show active" id="collapseProduk" role="tabpanel" aria-labelledby="collapseProduk-tab">
                                    <table class="table table-hover" id="collapseProduk">
                                        @forelse ($data->produk as $item)
                                            <tr>
                                                <th colspan="3" style="text-align: left; vertical-align: middle; font-size: 20px; background-color: #e25b31; color: #fff">Produk {{ $loop->iteration }} - {{ $item->produk }}</th>
                                            </tr>
                                            <tr>
                                                <td width="30%">ID Produk</td>
                                                <td width="1%">:</td>
                                                <td>{{ $item->id_produk }}</td>
                                            </tr>
                                            <tr>
                                                <td width="30%">Nama Produk</td>
                                                <td width="1%">:</td>
                                                <td>{{ $item->produk }}</td>
                                            </tr>
                                        @empty
                                            <tr>
                                                <td colspan="3">Tidak ada produk.</td>
                                            </tr>
                                        @endforelse
                                    </table>
                                </div>
                                <div class="tab-pane fade" id="collapseMesin" role="tabpanel" aria-labelledby="collapseMesin-tab">
                                    <table class="table table-hover" id="collapseMesin">
                                        @forelse ($data->mesin as $item)
                                            <tr>
                                                <th colspan="3" style="text-align: left; vertical-align: middle; font-size: 20px; background-color: #e25b31; color: #fff">Mesin {{ $loop->iteration }} - {{ $item->merk_tipe ?? 'Tidak Ada Merk' }}</th>
                                            </tr>
                                            @foreach ($item as $key => $item)
                                                <tr>
                                                    <td width="30%">{{ Str::headline($key) }}</td>
                                                    <td width="1">:</td>
                                                    <td>{{ $item }}</td>
                                                </tr>
                                            @endforeach
                                        @empty
                                            <tr>
                                                <td colspan="3">Tidak ada produk.</td>
                                            </tr>
                                        @endforelse
                                    </table>
                                </div>
                                <div class="tab-pane fade" id="collapseNaker" role="tabpanel" aria-labelledby="collapseNaker-tab">
                                    <table class="table table-hover" id="collapseNaker">
                                        @forelse ($data->naker as $item)
                                            @foreach ($item as $key => $item)
                                                <tr>
                                                    <td width="30%">{{ Str::headline($key) }}</td>
                                                    <td width="1">:</td>
                                                    <td>{{ $item }}</td>
                                                </tr>
                                            @endforeach
                                        @empty
                                            <tr>
                                                <td colspan="3">Tidak ada produk.</td>
                                            </tr>
                                        @endforelse
                                    </table>
                                </div>
                                <div class="tab-pane fade" id="collapseProduksi" role="tabpanel" aria-labelledby="collapseProduksi-tab">
                                    <table class="table table-hover" id="collapseProduksi">
                                        @forelse ($data->produksi as $item)
                                            <tr>
                                                <th colspan="3" style="text-align: left; vertical-align: middle; font-size: 20px; background-color: #e25b31; color: #fff">Produk {{ $loop->iteration }} - {{ $item->produk ?? 'Tidak Ada Merk' }}</th>
                                            </tr>
                                            @foreach ($item as $key => $item)
                                                <tr>
                                                    <td width="30%">{{ Str::headline($key) }}</td>
                                                    <td width="1">:</td>
                                                    <td>{{ $item }}</td>
                                                </tr>
                                            @endforeach
                                        @empty
                                            <tr>
                                                <td colspan="3">Tidak ada produk.</td>
                                            </tr>
                                        @endforelse
                                    </table>
                                </div>
                                <div class="tab-pane fade" id="collapseKapasitas" role="tabpanel" aria-labelledby="collapseKapasitas-tab">
                                    <table class="table table-hover" id="collapseKapasitas">
                                        @forelse ($data->kapasitas as $item)
                                            <tr>
                                                <th colspan="3" style="text-align: left; vertical-align: middle; font-size: 20px; background-color: #e25b31; color: #fff">Produk {{ $loop->iteration }} - {{ $item->produk ?? 'Tidak Ada Merk' }}</th>
                                            </tr>
                                            @foreach ($item as $key => $item)
                                                <tr>
                                                    <td width="30%">{{ Str::headline($key) }}</td>
                                                    <td width="1">:</td>
                                                    <td>{{ $item }}</td>
                                                </tr>
                                            @endforeach
                                        @empty
                                            <tr>
                                                <td colspan="3">Tidak ada produk.</td>
                                            </tr>
                                        @endforelse
                                    </table>
                                </div>
                                <div class="tab-pane fade" id="collapseBahanBaku" role="tabpanel" aria-labelledby="collapseBahanBaku-tab">
                                    <table class="table table-hover" id="collapseBahanBaku">
                                        @forelse ($data->bahan_baku as $item)
                                            @foreach ($item as $key => $item)
                                                <tr>
                                                    <td width="30%">{{ Str::headline($key) }}</td>
                                                    <td width="1">:</td>
                                                    <td>{{ $item }}</td>
                                                </tr>
                                            @endforeach
                                        @empty
                                            <tr>
                                                <td colspan="3">Tidak ada produk.</td>
                                            </tr>
                                        @endforelse
                                    </table>
                                </div>
                                <div class="tab-pane fade" id="collapseBahanPenolong" role="tabpanel" aria-labelledby="collapseBahanPenolong-tab">
                                    <table class="table table-hover" id="collapseBahanPenolong">
                                        @forelse ($data->bahan_penolong as $item)
                                            @foreach ($item as $key => $item)
                                                <tr>
                                                    <td width="30%">{{ Str::headline($key) }}</td>
                                                    <td width="1">:</td>
                                                    <td>{{ $item }}</td>
                                                </tr>
                                            @endforeach
                                        @empty
                                            <tr>
                                                <td colspan="3">Tidak ada produk.</td>
                                            </tr>
                                        @endforelse
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- CONTAINER END -->
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
