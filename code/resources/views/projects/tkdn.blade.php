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
            <form method="POST" action="{{ route('projects.tkdn-submit', $project->id) }}" enctype="multipart/form-data">
                @csrf
                <div class="row">
                    <div class="col-12">
                        <!-- CONTAINER -->
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
                                                        <input type="text" class="form-control" id="spk_no" autocomplete="off" name="spk_no" placeholder="Enter SPK Number" value="{{ $data->nib }}" disabled>
                                                    </div>
                                                </div>

                                                <div class="col-xl-12 col-md-12 col-sm-12">
                                                    <div class="form-group">
                                                        <label for="spk_no" class="form-label">NPWP</label>
                                                        <input type="text" class="form-control" id="spk_no" autocomplete="off" name="spk_no" placeholder="Enter SPK Number" value="{{ $data->npwp }}" disabled>
                                                    </div>
                                                </div>

                                                <div class="col-xl-12 col-md-12 col-sm-12">
                                                    <div class="form-group">
                                                        <label for="spk_no" class="form-label">Kode Produk</label>
                                                        <input type="text" class="form-control" id="spk_no" autocomplete="off" name="spk_no" placeholder="Enter SPK Number" value="{{ $data->kd_produk }}" disabled>
                                                    </div>
                                                </div>

                                                <div class="col-xl-12 col-md-12 col-sm-12">
                                                    <div class="form-group">
                                                        <label for="spk_no" class="form-label">Nomer Berkas</label>
                                                        <input type="text" class="form-control" id="spk_no" autocomplete="off" name="spk_no" placeholder="Enter SPK Number" value="{{ $data->no_berkas }}" disabled>
                                                    </div>
                                                </div>

                                                <div class="col-xl-12 col-md-12 col-sm-12">
                                                    <div class="form-group">
                                                        <label for="spk_no" class="form-label">Alamat Kantor</label>
                                                        <input type="text" class="form-control" id="spk_no" autocomplete="off" name="spk_no" placeholder="Enter SPK Number" value="{{ $data->alamat_kantor }}" disabled>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-6">
                                                <div class="col-xl-12 col-md-12 col-sm-12">
                                                    <div class="form-group">
                                                        <label for="spk_no" class="form-label">Nama CP</label>
                                                        <input type="text" class="form-control" id="spk_no" autocomplete="off" name="spk_no" placeholder="Enter SPK Number" value="{{ $data->nama_cp }}" disabled>
                                                    </div>
                                                </div>

                                                <div class="col-xl-12 col-md-12 col-sm-12">
                                                    <div class="form-group">
                                                        <label for="spk_no" class="form-label">No HP CP</label>
                                                        <input type="text" class="form-control" id="spk_no" autocomplete="off" name="spk_no" placeholder="Enter SPK Number" value="{{ $data->no_hp_cp }}" disabled>
                                                    </div>
                                                </div>

                                                <div class="col-xl-12 col-md-12 col-sm-12">
                                                    <div class="form-group">
                                                        <label for="spk_no" class="form-label">Email CP</label>
                                                        <input type="text" class="form-control" id="spk_no" autocomplete="off" name="spk_no" placeholder="Enter SPK Number" value="{{ $data->email_cp }}" disabled>
                                                    </div>
                                                </div>

                                                <div class="col-xl-12 col-md-12 col-sm-12">
                                                    <div class="form-group">
                                                        <label for="spk_no" class="form-label">Jabatan CP</label>
                                                        <input type="text" class="form-control" id="spk_no" autocomplete="off" name="spk_no" placeholder="Enter SPK Number" value="{{ $data->jabatan_cp }}" disabled>
                                                    </div>
                                                </div>

                                                <div class="col-xl-12 col-md-12 col-sm-12">
                                                    <div class="form-group">
                                                        <label for="spk_no" class="form-label">Alamat Pabrik</label>
                                                        <input type="text" class="form-control" id="spk_no" autocomplete="off" name="spk_no" placeholder="Enter SPK Number" value="{{ $data->alamat_pabrik }}" disabled>
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
                                                            <td width="10%" rowspan="2" style="text-align: center; vertical-align: middle; font-size: 20px;"><strong>{{ $loop->iteration }}</strong></td>
                                                            <td width="30%">ID Produk</td>
                                                            <td width="1%">:</td>
                                                            <td>{{ $item['id_produk'] }}</td>
                                                        </tr>
                                                        <tr>
                                                            <td width="30%">Nama Produk</td>
                                                            <td width="1%">:</td>
                                                            <td>{{ $item['produk'] }}</td>
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
                                {{-- {{ dd($project) }} --}}
                                @if ($project->stage != '1' || $project->status != null)
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
                                    @forelse (json_decode($project->orders->siinas_data)->produk ?? [] as $item)
                                        <div class="card custom-card">
                                            <div class="card-header border-bottom">
                                                <h3 class="card-title">{{ Str::headline($item->produk) }} Document</h3>
                                            </div>
                                            <div class="card-body">
                                                <div class="row">
                                                    <div class="col-12">
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
                                                                    @if (Str::is(Str::headline($item->produk) . '*', $file->label))
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
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-12">
                                                        @forelse ($project->tkdn as $tkdn)
                                                            @if ($tkdn->id_produk == $item->id_produk)
                                                                <input type="hidden" name="id_produk[{{ $item->produk }}]" value="{{ $item->id_produk }}">
                                                                <div class="row">
                                                                    <div class="col-xl-12 col-md-12 col-sm-12">
                                                                        <div class="form-group">
                                                                            <label for="spk_no" class="form-label">Nilai TKDN</label>
                                                                            <input type="text" class="form-control" id="spk_no" autocomplete="off" name="nilai_tkdn" placeholder="Enter SPK Number" value="{{ $tkdn?->nilai_tkdn }}" disabled>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="row">
                                                                    <div class="col-xl-12 col-md-12 col-sm-12">
                                                                        <div class="form-group">
                                                                            <label for="spk_no" class="form-label">Nilai TKDN Jasa</label>
                                                                            <input type="text" class="form-control" id="spk_no" autocomplete="off" name="nilai_tkdn_jasa" placeholder="Enter SPK Number" value="{{ $tkdn?->nilai_tkdn_jasa }}" disabled>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="row">
                                                                    <div class="col-xl-12 col-md-12 col-sm-12">
                                                                        <div class="form-group">
                                                                            <label for="spk_no" class="form-label">Nilai TKDN Gabungan</label>
                                                                            <input type="text" class="form-control" id="spk_no" autocomplete="off" name="nilai_tkdn_gabungan" placeholder="Enter SPK Number" value="{{ $tkdn?->nilai_tkdn_gabungan }}" disabled>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            @endif
                                                        @empty
                                                        @endforelse
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    @empty
                                        <h4>Tidak ada produk</h4>
                                    @endforelse
                                @endif
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-12">
                        <div class="card custom-card">
                            <div class="card-header border-bottom">
                                <h3 class="card-title">Hasil Verifikasi</h3>
                            </div>
                            <div class="card-body">

                                <div class="row">
                                    <div class="col-xl-12 col-md-12 col-sm-12">
                                        <div class="form-group">
                                            <label for="" class="form-label">Alasan</label>
                                            <textarea class="form-control" name="note">{{ $project->data->qc_note }}</textarea>
                                        </div>
                                    </div>
                                </div>
                                <div>
                                    <button type="submit" onclick="siinasSubmit()" class="btn btn-primary mt-4 mb-0">Submit</button>
                                    <a href="{{ route('dashboard') }}" class="btn btn-secondary mt-4 mb-0">Back</a>
                                </div>

                            </div>
                        </div>
                    </div>
                    <!-- CONTAINER END -->
                </div>
            </form>
        </div>
    </div>
@endsection
@section('js')
@endsection

@section('custom-js')
    <script>
        $(document).ready(function() {
            var max_fields = 10; //maximum input boxes allowed
            var wrapper = $(".form-upload"); //Fields wrapper
            var add_button = $(".add_field_button"); //Add button ID

            var x = 1; //initlal text box count
            $(add_button).on("click", function(e) { //on add input button click
                e.preventDefault();
                if (x < max_fields) { //max input box allowed
                    x++; //text box increment
                    $(wrapper).append(`
                        <div class="col-xl-12 col-md-12 col-sm-12">
                            <div class="form-group">
                                <label for="spk_no" class="form-label">File Name</label>
                                <div class="row">
                                    <input type="text" class="form-control col-2" name="file_name[]">
                                    <br>
                                    <input class="form-control col-9 offset-md-1" type="file" id="formFileMultiple" autocomplete="off" name="file[]" accept="application/pdf">
                                </div>
                            </div>
                        </div>
                    `); //add input box
                }
            });

            $(wrapper).on("click", ".remove_field", function(e) { //user click on remove text
                e.preventDefault();
                $(this).parent('div').remove();
                x--;
            })
        });

        // $(function(e) {
        //     $('.fc-datepicker').datepicker({
        //         dateFormat: 'yy-mm-dd'
        //     });
        // });
    </script>
@endsection
