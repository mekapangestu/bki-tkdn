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
                <h1 class="page-title">QC Perhitungan TKDN</h1>
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
            <form method="POST" action="{{ route('projects.tkdn-submit', $project->id) }}" enctype="multipart/form-data" class="swa-confirm">
                @csrf
                <input type="hidden" name="project_id" value="{{ $project->id }}" readonly>
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
                                    @forelse ($project->productType ?? [] as $item)
                                        <div class="card custom-card">
                                            <div class="card-header border-bottom">
                                                <h3 class="card-title">{{ Str::headline($item->tipe_produk) }} Document</h3>
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
                                                                    @if ($item->id == $file->id_produk)
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
                                                    <div class="col-8">
                                                        @forelse ($project->tkdn as $tkdn)
                                                            @if ($tkdn->id_produk == $item->id)
                                                                <input type="hidden" name="id_produk[]" value="{{ $item->id }}">
                                                                <div class="row">
                                                                    <div class="col-xl-4 col-md-4 col-sm-4">
                                                                        <div class="form-group">
                                                                            <label for="spk_no" class="form-label">Nilai TKDN</label>
                                                                            <input type="text" class="form-control" id="spk_no" autocomplete="off" name="nilai_tkdn" value="{{ $tkdn?->nilai_tkdn }}" readonly>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-xl-4 col-md-4 col-sm-4">
                                                                        <div class="form-group">
                                                                            <label for="spk_no" class="form-label">Nilai TKDN Jasa</label>
                                                                            <input type="text" class="form-control" id="spk_no" autocomplete="off" name="nilai_tkdn_jasa" value="{{ $tkdn?->nilai_tkdn_jasa }}" readonly>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-xl-4 col-md-4 col-sm-4">
                                                                        <div class="form-group">
                                                                            <label for="spk_no" class="form-label">Nilai TKDN Gabungan</label>
                                                                            <input type="text" class="form-control" id="spk_no" autocomplete="off" name="nilai_tkdn_gabungan" value="{{ $tkdn?->nilai_tkdn_gabungan }}" readonly>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="row">
                                                                    <div class="col-xl-4 col-md-4 col-sm-4">
                                                                        <div class="form-group">
                                                                            <label for="" class="form-label">Draf Hasil Persetujuan Penamaan Tanda Sah</label>
                                                                            <input class="form-control" type="file" id="formFileMultiple" autocomplete="off" name="hasil_persetujuan[{{ $item->id }}]" accept="application/msword, application/vnd.ms-excel, text/plain, application/pdf">
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-xl-4 col-md-4 col-sm-4">
                                                                        <div class="form-group">
                                                                            <label for="" class="form-label">Laporan Hasil Verifikasi</label>
                                                                            <input class="form-control" type="file" id="formFileMultiple" autocomplete="off" name="laporan_hasil_verifikasi[{{ $item->id }}]" accept="application/msword, application/vnd.ms-excel, text/plain, application/pdf">
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-xl-4 col-md-4 col-sm-4">
                                                                        <div class="form-group">
                                                                            <label for="" class="form-label">Form Perhitungan Nilai TKDN</label>
                                                                            <input class="form-control" type="file" id="formFileMultiple" autocomplete="off" name="form_perhitungan_nilai_tkdn[{{ $item->id }}]" accept="application/msword, application/vnd.ms-excel, text/plain, application/pdf">
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            @endif
                                                        @empty
                                                        @endforelse
                                                    </div>
                                                    <div class="col-4">
                                                        <div class="card custom-card">
                                                            <div class="card-header border-bottom">
                                                                <h3 class="card-title">Foto Produk</h3>
                                                            </div>
                                                            <div class="card-body">
                                                                <ul class="lightgallery list-unstyled row">
                                                                    @foreach ($project->foto as $file)
                                                                        @if ($item->id == $file->id_produk)
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
                                            <label class="custom-control custom-checkbox">
                                                <input type="checkbox" class="custom-control-input" required>
                                                <span class="custom-control-label">Klasifikasi produk dengan Form yang digunakan sesuai peraturan yang berlaku</span>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-xl-12 col-md-12 col-sm-12">
                                        <div class="form-group">
                                            <label class="custom-control custom-checkbox">
                                                <input type="checkbox" class="custom-control-input" required>
                                                <span class="custom-control-label">Kesesuaian penamaan produk dengan data yang verifikasi</span>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-xl-12 col-md-12 col-sm-12">
                                        <div class="form-group">
                                            <label class="custom-control custom-checkbox">
                                                <input type="checkbox" class="custom-control-input" required>
                                                <span class="custom-control-label">Kesesuaian data dalam perhitungan dengan dokumen pendukung</span>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-xl-12 col-md-12 col-sm-12">
                                        <div class="form-group">
                                            <label class="custom-control custom-checkbox">
                                                <input type="checkbox" class="custom-control-input">
                                                <span class="custom-control-label">Kesesuaian perhitungan produk tingkat 2 jika ada</span>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-xl-12 col-md-12 col-sm-12">
                                        <div class="form-group">
                                            <label class="custom-control custom-checkbox">
                                                <input type="checkbox" class="custom-control-input">
                                                <span class="custom-control-label">Kesesuaian Dokumen Pengambangan jika ada</span>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-xl-12 col-md-12 col-sm-12">
                                        <div class="form-group">
                                            <label class="custom-control custom-checkbox">
                                                <input type="checkbox" class="custom-control-input" required>
                                                <span class="custom-control-label">Assesor mengerti tentang produk dan proses produksi produk yang dihitung</span>
                                            </label>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-xl-12 col-md-12 col-sm-12">
                                        <div class="form-group">
                                            <label for="" class="form-label">Alasan</label>
                                            <textarea class="form-control notes" name="note">{{ $project->data->qc_note }}</textarea>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-xl-12 col-md-12 col-sm-12">
                                        <div class="form-group">
                                            <label for="" class="form-label">Status</label>
                                            <select class="form-control" name="action" id="action" required>
                                                <option value="" selected disabled>-- Pilih Status --</option>
                                                <option value="1">Terima</option>
                                                <option value="0">Tolak</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <div>
                                    <button type="submit" class="btn btn-primary mt-4 mb-0">Submit</button>
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
        $('#action').on('change', function() {
            if (this.value == 1) {
                $("input").not(':input[type=search]').attr("required", true);
                $(".notes").removeAttr("required", true);
            } else {
                $(".notes").attr("required", true);
                $("input").not(':input[type=search]').removeAttr("required", true);
            }
        });

        $("form.swa-confirm").submit(function(e) {
            if ($('#action').val() == 1) {
                e.preventDefault();
                swal({
                        title: "Apakah anda yakin?",
                        text: "Data dan dikirimkan ke SIINAS",
                        type: "info",
                        showCancelButton: true,
                        confirmButtonColor: '#3085d6',
                        cancelButtonColor: '#d33',
                        confirmButtonText: 'Yes, Submit!',
                        closeOnConfirm: false,
                        closeOnCancel: false
                    },
                    function(isConfirm) {
                        if (isConfirm) {
                            $("form.swa-confirm").off("submit").submit();
                        } else {
                            swal("Cancelled", "", "error");
                        }
                    });
            }
        })
    </script>
@endsection
