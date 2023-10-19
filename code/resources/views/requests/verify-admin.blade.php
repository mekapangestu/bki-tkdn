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
                            <form method="POST" action="{{ route('requests.verify-admin-submit', $project->id) }}" enctype="multipart/form-data">
                                @csrf
                                <input type="hidden" name="project_id" value="{{ $project->id }}" readonly>
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
                                        <table class="table" id="collapseProduk">
                                            @forelse (collect($data->produk) as $item)
                                                <tr>
                                                    <th colspan="3" style="text-align: left; vertical-align: middle; font-size: 20px; background-color: #e25b31; color: #fff">Produk {{ $loop->iteration }} - {{ $item->produk }}</th>
                                                </tr>
                                                <tr>
                                                    <td width="20%">ID Produk</td>
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
                                                {{-- {{ dd($item) }} --}}
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
                                    <div class="row">
                                        <div class="col-xl-12 col-md-12 col-sm-12">
                                            <div class="form-group">
                                                <label for="" class="form-label">Alasan</label>
                                                <textarea class="form-control notes" name="alasan_tolak"></textarea>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                {{-- <button type="submit" name="action" value="1" class="btn btn-primary mt-4 mb-0">Terima</button> --}}
                                <button type="submit" name="action" value="4" onclick="siinasSubmit(4)" class="btn btn-success mt-4 mb-0">Terima</button>
                                <button type="submit" name="action" value="0" onclick="siinasSubmit(0)" class="btn btn-danger mt-4 mb-0">Tolak</button>
                                {{-- <button type="submit" name="action" value="3" class="btn btn-warning mt-4 mb-0">Freeze/Pending</button> --}}
                                {{-- <a href="{{ route('dashboard') }}" class="btn btn-secondary mt-4 mb-0">Back</a> --}}
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <!-- CONTAINER END -->
        </div>
    @endsection
