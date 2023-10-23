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
                <h1 class="page-title">Lengkapi Data</h1>
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

            @include('partials.files')
            
            <div class="row">
                <div class="col-12">
                    <div class="card">
                        <div class="card-header">
                            <h3 class="card-title">Upload Kelengkapan Dokumen *</h3>
                        </div>
                        <div class="card-body">
                            <div class="row">
                                <div class="col-12">
                                    <div class="container max-w-7xl mx-auto mt-20 p-10">
                                        <h2 id="dokumen-pendukung" class="text-4xl text-center">Lingkup Kebutuhan Dokumen TKDN</h2>
                                        <hr class="border-2 border-primary mx-auto mt-2 text-center" style="width: 100px;" />
                                        <h3 class="text-3xl">Lingkup Kebutuhan Dokumen TKDN Barang</h3>
                                        <div class="row">
                                            <div class="col-4">
                                                <h4 class="text-xl mt-2 font-bold">Aspek Legal</h4>
                                                <ol class="mt-4 ordered-list">
                                                    <li>NIB</li>
                                                    <li>Izin Usaha Industri</li>
                                                    <li>Akta Perusahaan</li>
                                                    <li>NPWP</li>
                                                </ol>
                                            </div>
                                            <div class="col-4">
                                                <h4 class="text-xl mt-2 font-bold">Aspek Produksi</h4>
                                                <ol class="mt-4 ordered-list">
                                                    <li>Flow Proses Produksi</li>
                                                    <li>Laporan Produksi</li>
                                                    <li>Bill off Material/ Komponen Produksi</li>
                                                    <li>Nilai Perolehan Material Produksi</li>
                                                    <li>Photo komponen material produksi</li>
                                                    <li>Daftar dan Nilai Perolehan Mesin Produksi</li>
                                                    <li>Struktur Organisasi Produksi</li>
                                                </ol>
                                            </div>
                                            <div class="col-4">
                                                <h4 class="text-xl mt-2 font-bold">Aspek Pemasaran</h4>
                                                <ol class="mt-4 ordered-list">
                                                    <li>Katalog Produk</li>
                                                    <li>Laporan Penjualan</li>
                                                    <li>Jalur Pemasaran</li>
                                                </ol>
                                            </div>
                                        </div>
                                        <h3 class="text-3xl mt-5">Lingkup Kebutuhan Dokumen TKDN Barang & Jasa</h3>
                                        <div class="row">
                                            <div class="col-4">
                                                <h4 class="text-xl mt-2 font-bold">Kontrak</h4>
                                                <ol class="mt-4 ordered-list">
                                                    <li>RAB, BOQ, AHSP</li>
                                                    <li>Scope Of Work</li>
                                                    <li>Profil Proyek</li>
                                                    <li>Daftar Vendor/Subkontraktor</li>
                                                    <li>Foto Proyek</li>
                                                </ol>
                                            </div>
                                            <div class="col-4">
                                                <h4 class="text-xl mt-2 font-bold">Tenaga Kerja</h4>
                                                <ol class="mt-4 ordered-list">
                                                    <li>Struktur Organisasi Proyek</li>
                                                    <li>Daftar Tenaga Kerja</li>
                                                    <li>Bukti Kewarganegaraan Tenaga Kerja</li>
                                                </ol>
                                            </div>
                                            <div class="col-4">
                                                <h4 class="text-xl mt-2 font-bold">Material</h4>
                                                <ol class="mt-4 ordered-list">
                                                    <li>Invoice Pembelian Material</li>
                                                    <li>Sertifikat TKDN</li>
                                                    <li>Mill Certificate</li>
                                                </ol>
                                            </div>
                                            <div class="col-4">
                                                <h4 class="text-xl mt-2 font-bold">Alat Kerja</h4>
                                                <ol class="mt-4 ordered-list">
                                                    <li>Bukti Kepemilikan Alat Kerja</li>
                                                    <li>Bukti Penyewaan Alat Kerja (jika sewa)</li>
                                                    <li>Bukti Status Kepemilikan Saham Perusahaan</li>
                                                </ol>
                                            </div>
                                            <div class="col-4">
                                                <h4 class="text-xl mt-2 font-bold">Jasa Umum</h4>
                                                <ol class="mt-4 ordered-list">
                                                    <li>Bukti pembayaran jasa (Mobilisasi, dll)</li>
                                                    <li>Perhitungan TKDN Vendor/Subkontraktor</li>
                                                </ol>
                                            </div>
                                        </div>
                                    </div>
                                    <form method="POST" action="{{ route('requests.upload-document-submit') }}" enctype="multipart/form-data">
                                        @csrf
                                        <input type="hidden" name="project_id" value="{{ $project->id }}" readonly>
                                        <div class="row">
                                            <div class="col-xl-12 col-md-12 col-sm-12">
                                                <div class="form-group">
                                                    <label for="" class="form-label">SPTJM</label>
                                                    <input class="form-control" type="file" id="formFileMultiple" autocomplete="off" name="sptjm" accept="application/msword, application/vnd.ms-excel, text/plain, application/pdf">
                                                </div>
                                            </div>
                                        </div>
                                        @foreach (['NIB', 'Izin Usaha Industri', 'Akta Perusahaan', 'NPWP', 'Katalog Produk', 'Laporan Penjualan', 'Jalur Pemasaran'] as $req_doc)
                                            <div class="d-flex justify-content-between">
                                                <div class="col-2">
                                                    <div class="form-group">
                                                        <label for="spk_no" class="form-label">Nama Dokumen</label>
                                                        <div class="row">
                                                            <input type="text" class="form-control" name="req_name[]" value="{{$req_doc}}" readonly required>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-2">
                                                    <div class="form-group">
                                                        <label for="spk_no" class="form-label">Nomor Dokumen</label>
                                                        <div class="row">
                                                            <input type="text" class="form-control" name="req_number[]">
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-2">
                                                    <div class="form-group">
                                                        <label for="spk_no" class="form-label">Berlaku Sejak</label>
                                                        <div class="row">
                                                            <input type="text" class="form-control fc-datepicker" name="req_valid_since[]">
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-2">
                                                    <div class="form-group">
                                                        <label for="spk_no" class="form-label">Berlaku Sampai</label>
                                                        <div class="row">
                                                            <input type="text" class="form-control fc-datepicker" name="req_valid_until[]">
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-2">
                                                    <div class="form-group">
                                                        <label for="spk_no" class="form-label">Upload Dokumen</label>
                                                        <div class="row">
                                                            <input class="form-control" type="file" id="formFileMultiple" autocomplete="off" name="req_file[]" accept="application/msword, application/vnd.ms-excel, text/plain, application/pdf" required>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-1">
                                                    <div class="form-group">
                                                        <label for="spk_no" class="form-label">&nbsp;</label>
                                                        <div class="row">
                                                            <a href="#" class="btn btn-danger disabled" style="width:100px">Remove</a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        @endforeach
                                        @forelse ($project->productType ?? [] as $item)
                                            <br>
                                            <p><strong>{{ $loop->iteration }}. {{ Str::upper($item->tipe_produk) }}</strong></p>
                                            <div class="col-3">
                                                <div class="form-group">
                                                    <label for="spk_no" class="form-label">Upload Foto Produk</label>
                                                    <div class="row">
                                                        <input class="form-control" type="file" id="formFileMultiple" autocomplete="off" name="foto[{{ $item->id }}]" accept="image/*">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-upload-{{ $item->id }}">
                                                <div class="d-flex justify-content-between">
                                                    <div class="col-2">
                                                        <div class="form-group">
                                                            <label for="spk_no" class="form-label">Nama Dokumen</label>
                                                            <div class="row">
                                                                <input type="text" class="form-control" name="file_name[{{ $item->id }}][]" required>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-2">
                                                        <div class="form-group">
                                                            <label for="spk_no" class="form-label">Nomor Dokumen</label>
                                                            <div class="row">
                                                                <input type="text" class="form-control" name="number[{{ $item->id }}][]">
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-2">
                                                        <div class="form-group">
                                                            <label for="spk_no" class="form-label">Berlaku Sejak</label>
                                                            <div class="row">
                                                                <input type="text" class="form-control fc-datepicker" name="valid_since[{{ $item->id }}][]">
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-2">
                                                        <div class="form-group">
                                                            <label for="spk_no" class="form-label">Berlaku Sampai</label>
                                                            <div class="row">
                                                                <input type="text" class="form-control fc-datepicker" name="valid_until[{{ $item->id }}][]">
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-2">
                                                        <div class="form-group">
                                                            <label for="spk_no" class="form-label">Upload Dokumen</label>
                                                            <div class="row">
                                                                <input class="form-control" type="file" id="formFileMultiple" autocomplete="off" name="file[{{ $item->id }}][]" accept="application/msword, application/vnd.ms-excel, text/plain, application/pdf" required>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-1">
                                                        <div class="form-group">
                                                            <label for="spk_no" class="form-label">&nbsp;</label>
                                                            <div class="row">
                                                                <a href="#" class="btn btn-danger remove_field" style="width:100px">Remove</a>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <a class="add_field_button-{{ $item->id }} btn btn-info">Add File Baru</a><br>
                                        @empty
                                            <h4>Tidak ada produk</h4>
                                        @endforelse
                                        <div>
                                            <button type="submit" class="btn btn-primary mt-4 mb-0">Submit</button> <a href="{{ route('dashboard') }}" class="btn btn-secondary mt-4 mb-0">Back</a>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- CONTAINER END -->
            </div>
        </div>
    </div>
@endsection
@section('js')
@endsection
@section('custom-js')
    <script>
        $(document).ready(function() {
            var max_fields = 10; //maximum input boxes allowed
            var wrapper = $("[class*=form-upload]"); //Fields wrapper
            var add_button = $("[class*=add_field_button]"); //Add button ID

            var x = 1; //initlal text box count
            $(add_button).on("click", function(e) { //on add input button click
                // $(this).prev().find('div').first().clone().appendTo($(this).prev())
                let clone = $(this).prev().find('div').first().clone()
                clone.find('input').val('')
                clone.appendTo($(this).prev())
                $('.fc-datepicker').bootstrapdatepicker({
                    format: "yyyy-mm-dd",
                    viewMode: "date",
                });
                // e.preventDefault();
                // if (x < max_fields) { //max input box allowed
                //     x++; //text box increment
                //     $(this).prev().append(`
            //         <div class="col-xl-12 col-md-12 col-sm-12">
            //             <div class="form-group">
            //                 <label for="spk_no" class="form-label">File Name</label>
            //                 <div class="row">
            //                     <input type="text" class="form-control col-2" name="file_name[]">
            //                     <br>
            //                     <input class="form-control col-9 offset-md-1" type="file" id="formFileMultiple" autocomplete="off" name="file[]" accept="application/msword, application/vnd.ms-excel, text/plain, application/pdf">
            //                 </div>
            //             </div>
            //         </div>
            //     `); //add input box
                // }
            });

            $(wrapper).on("click", ".remove_field", function(e) { //user click on remove text
                e.preventDefault();
                $(this).parents('div.d-flex').remove();
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
