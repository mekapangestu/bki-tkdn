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
                    @include('partials.files')
                    <div class="card custom-card">
                        <div class="card-header border-bottom">
                            <h3 class="card-title">Upload Hasil Verifikasi</h3>
                        </div>
                        <div class="card-body">
                            <form method="POST" action="{{ route('projects.verify2-submit', $project->id) }}" enctype="multipart/form-data">
                                @csrf
                                <input type="hidden" name="project_id" value="{{ $project->id }}" readonly>
                                @forelse ($project->productType ?? [] as $item)
                                    <div class="card">
                                        <div class="card-header" style="text-align: left; vertical-align: middle; background-color: #e25b31; color: #fff">
                                            <h4><strong>{{ Str::upper($item->tipe_produk) }}</strong></h4>
                                        </div>
                                        <h4 style="padding-top: 30px"><strong>INPUT NILAI TKDN</strong></h4>
                                        <div class="row">
                                            <div class="col-12">
                                                <input type="hidden" name="id_produk[]" value="{{ $item->id }}">
                                                <div class="row">
                                <div class="col-3">
                                    <div class="form-group">
                                        <label for="" class="form-label">Kode HS</label>
                                        <input class="form-control" name="kode_hs[{{$item->id}}]" required value="{{$item->kode_hs}}">
                                    </div>
                                </div>
                                <div class="col-3">
                                    <div class="form-group">
                                        <label for="" class="form-label">Tipe Produk</label>
                                        <input class="form-control" name="tipe_produk[{{$item->id}}]" required value="{{$item->tipe_produk}}">
                                    </div>
                                </div>
                                <div class="col-6">
                                    <div class="form-group">
                                        <label for="" class="form-label">Spesifikasi</label>
                                        <textarea class="form-control" name="spesifikasi[{{$item->id}}]" required>{{$item->spesifikasi}}</textarea>
                                    </div>
                                </div>
                            </div>
                                                <div class="row">
                                                    <div class="col-xl-3 col-md-12 col-sm-12">
                                                        <div class="form-group">
                                                            <label for="spk_no" class="form-label">Nilai TKDN</label>
                                                            <input type="text" class="form-control" id="spk_no" autocomplete="off" pattern="^\d*(\.\d{0,2})?$" name="nilai_tkdn[{{ $item->id }}]" value="" required>
                                                        </div>
                                                    </div>
                                                    <div class="col-xl-3 col-md-12 col-sm-12">
                                                        <div class="form-group">
                                                            <label for="spk_no" class="form-label">Nilai TKDN Jasa</label>
                                                            <input type="text" class="form-control" id="spk_no" autocomplete="off" pattern="^\d*(\.\d{0,2})?$" name="nilai_tkdn_jasa[{{ $item->id }}]" value="" required>
                                                        </div>
                                                    </div>
                                                    <div class="col-xl-3 col-md-12 col-sm-12">
                                                        <div class="form-group">
                                                            <label for="spk_no" class="form-label">Nilai TKDN Gabungan</label>
                                                            <input type="text" class="form-control" id="spk_no" autocomplete="off" pattern="^\d*(\.\d{0,2})?$" name="nilai_tkdn_gabungan[{{ $item->id }}]" value="" required>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-xl-3 col-md-12 col-sm-12">
                                                        <div class="form-group">
                                                            <label for="" class="form-label">Draft Laporan Hasil Verifikasi</label>
                                                            <input class="form-control" type="file" id="formFileMultiple" autocomplete="off" name="hasil_verifikasi[{{ $item->id }}]" accept="application/msword, application/vnd.ms-excel, text/plain, application/pdf" required>
                                                        </div>
                                                    </div>
                                                    <div class="col-xl-3 col-md-12 col-sm-12">
                                                        <div class="form-group">
                                                            <label for="" class="form-label">Draft Form Penghitungan Nilai TKDN</label>
                                                            <input class="form-control" type="file" id="formFileMultiple" autocomplete="off" name="form_nilai_tkdn[{{ $item->id }}]" accept="application/msword, application/vnd.ms-excel, text/plain, application/pdf" required>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <h4 style="padding-top: 30px"><strong>INPUT DATA TAMBAHAN</strong></h4>
                                            <div class="row">
                                                <div class="col-xl-3 col-md-12 col-sm-12">
                                                    <div class="form-group">
                                                        <label for="spk_no" class="form-label">Standar</label>
                                                        <input type="text" class="form-control" autocomplete="off" name="standar[{{ $item->id }}]" placeholder="Enter Standar" value="">
                                                    </div>
                                                </div>
                                                <div class="col-xl-3 col-md-12 col-sm-12">
                                                    <div class="form-group">
                                                        <label for="spk_no" class="form-label">Produsen</label>
                                                        <input type="text" class="form-control" autocomplete="off" name="produsen[{{ $item->id }}]" placeholder="Enter Produsen" value="">
                                                    </div>
                                                </div>
                                                <div class="col-xl-3 col-md-12 col-sm-12">
                                                    <div class="form-group">
                                                        <label for="spk_no" class="form-label">Sertifikat Produk</label>
                                                        <input type="text" class="form-control" autocomplete="off" name="sertifikat_produk[{{ $item->id }}]" placeholder="Enter Sertifikat Produk" value="">
                                                    </div>
                                                </div>
                                                <div class="col-xl-3 col-md-12 col-sm-12">
                                                    <div class="form-group">
                                                        <label for="spk_no" class="form-label">Kode Kelompok Barang</label>
                                                        {{-- <input type="text" class="form-control" autocomplete="off" name="kd_kelompok_barang[{{$item->id_produk}}]" placeholder="Enter Kode Kelompok Barang" value="" > --}}
                                                        <select class="form-control select-search" name="kd_kelompok_barang[{{ $item->id }}]" placeholder="Enter Kode Kelompok Barang">
                                                            <option>Pilih Kode Kelompok Barang</option>
                                                            @foreach ($kelompok_barang as $option)
                                                                <option>{{ $option->name }}</option>
                                                            @endforeach
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="col-xl-3 col-md-12 col-sm-12">
                                                    <div class="form-group">
                                                        <label for="spk_no" class="form-label">Merk</label>
                                                        <input type="text" class="form-control" autocomplete="off" name="merk[{{ $item->id }}]" placeholder="Enter Merk" value="">
                                                    </div>
                                                </div>
                                                <div class="col-xl-3 col-md-12 col-sm-12">
                                                    <div class="form-group">
                                                        <label for="spk_no" class="form-label">Tipe</label>
                                                        <input type="text" class="form-control" autocomplete="off" name="tipe[{{ $item->id }}]" placeholder="Enter Tipe" value="">
                                                    </div>
                                                </div>
                                                {{-- <div class="col-xl-3 col-md-12 col-sm-12">
                                                    <div class="form-group">
                                                        <label for="spk_no" class="form-label">Kode HS</label>
                                                        <input type="text" class="form-control" autocomplete="off" name="kd_hs[{{ $item->id }}]" placeholder="Enter Kode HS" value=""> --}}
                                                        {{-- <select class="form-control select-search" name="kd_hs[{{ $item->id_produk }}]" placeholder="Enter Kode Kelompok Barang">
                                                            <option>Pilih Kode HS</option>
                                                            @foreach ($kelompok_barang as $option)
                                                                <option>{{ $option->name }}</option>
                                                            @endforeach
                                                        </select> --}}
                                                    {{-- </div>
                                                </div> --}}
                                                {{-- <div class="col-xl-3 col-md-12 col-sm-12">
                                                    <div class="form-group">
                                                        <label for="spk_no" class="form-label">Spesifikasi</label>
                                                        <input type="text" class="form-control" autocomplete="off" name="spesifikasi[{{ $item->id }}]" placeholder="Enter Spesifikasi" value="">
                                                    </div>
                                                </div> --}}
                                                <div class="col-xl-3 col-md-12 col-sm-12">
                                                    <div class="form-group">
                                                        <label for="spk_no" class="form-label">KBLI</label>
                                                        {{-- <input type="text" class="form-control" autocomplete="off" name="kbli[{{ $item->id_produk }}]" placeholder="Enter KBLI" value=""> --}}
                                                        <select class="form-control select-search" name="kbli[{{ $item->id }}]" data-placeholder="Pilih KBLI">
                                                            <option></option>
                                                            @foreach ($kbli as $option)
                                                                <option value="{{ $option->kode }}">{{ $option->kode }} {{ $option->uraian }}</option>
                                                            @endforeach
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                @empty
                                    <h4>Tidak ada produk</h4>
                                @endforelse
                                <div class="form-upload"></div>
                                {{-- <a class="add_field_button btn btn-info" style="width:100px;margin: 12px 0;">Add File</a> --}}
                                <div class="col-xl-12 col-md-12 col-sm-12">
                                    <div class="form-group">
                                        <label class="custom-control custom-checkbox">
                                            <input type="checkbox" class="custom-control-input" required>
                                            <span class="custom-control-label">Evaluasi Penilaian Sendiri Perusahaan (Self Assessment)</span>
                                        </label>
                                    </div>
                                </div>
                                <div class="col-xl-12 col-md-12 col-sm-12">
                                    <div class="form-group">
                                        <label class="custom-control custom-checkbox">
                                            <input type="checkbox" class="custom-control-input" required>
                                            <span class="custom-control-label">Verifikasi Dokumen sesuai Peraturan yang berlaku</span>
                                        </label>
                                    </div>
                                </div>
                                <div class="col-xl-12 col-md-12 col-sm-12">
                                    <div class="form-group">
                                        <label class="custom-control custom-checkbox">
                                            <input type="checkbox" class="custom-control-input" required>
                                            <span class="custom-control-label">Verifikasi lapangan</span>
                                        </label>
                                    </div>
                                </div>
                                <div>
                                    <button type="submit" class="btn btn-primary mt-4 mb-0">Submit</button>
                                    <a href="{{ route('dashboard') }}" class="btn btn-secondary mt-4 mb-0">Back</a>
                                </div>
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
                                    <input class="form-control col-9 offset-md-1" type="file" id="formFileMultiple" autocomplete="off" name="file[]" accept="application/msword, application/vnd.ms-excel, text/plain, application/pdf" required>
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
