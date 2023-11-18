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

                    @include('partials.detail')
                    
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
                                @include('partials.files')
                            @endif
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <form method="POST" action="{{ route('requests.verify-admin-final-submit', $project->id) }}" enctype="multipart/form-data">
                    @csrf
                <div class="col-12">
                    <div class="card custom-card">
                        <div class="card-header border-bottom">
                            <h3 class="card-title">Produk</h3>
                        </div>
                        <div class="card-body">
                        @forelse ($project->productType ?? [] as $item)
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
                            @empty
                            <h4>Tidak ada produk</h4>
                        @endforelse
                        </div>
                    </div>
                    <div class="card custom-card">
                        <div class="card-header border-bottom">
                            <h3 class="card-title">Hasil Verifikasi</h3>
                        </div>
                        <div class="card-body">
                                <div class="row">
                                    <div class="col-xl-12 col-md-12 col-sm-12">
                                        <div class="form-group">
                                            <label for="spk_no" class="form-label">Judul BAST</label>
                                            <input type="text" class="form-control" id="spk_no" autocomplete="off" name="judul" value="{{ $project->judul }}" disabled>
                                        </div>
                                    </div>
                                    <div class="col-xl-12 col-md-12 col-sm-12">
                                        <div class="form-group">
                                            <label for="spk_no" class="form-label">Nomor BAST</label>
                                            <input type="text" class="form-control" id="spk_no" autocomplete="off" name="bast_no" value="{{ $project->bast_no }}" disabled>
                                        </div>
                                    </div>
                                    <div class="col-xl-12 col-md-12 col-sm-12">
                                        <div class="form-group">
                                            <label for="spk_no" class="form-label">Tanggal BAST</label>
                                            <input type="text" class="form-control fc-datepicker" id="spk_no" autocomplete="off" name="bast_date" value="{{ $project->bast_date }}" disabled>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-xl-12 col-md-12 col-sm-12">
                                            <div class="form-group">
                                                <label for="" class="form-label">Alasan</label>
                                                <textarea class="form-control notes" name="note"></textarea>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xl-12 col-md-12 col-sm-12">
                                        <div class="form-group">
                                            <label for="" class="form-label">Status</label>
                                            <select class="form-control" name="action" id="action" required>
                                                <option value="" selected disabled>-- Pilih Status --</option>
                                                <option value="1">Terima</option>
                                                <option value="0">Tolak</option>
                                                <option value="3">Freeze/Pending</option>
                                                <option value="2">Pengembalian Dokumen</option>
                                            </select>
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
                                    <input class="form-control col-9 offset-md-1" type="file" id="formFileMultiple" autocomplete="off" name="file[]" accept="application/msword, application/vnd.ms-excel, text/plain, application/pdf, .zip, .rar">
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
        </script>
    @endsection
