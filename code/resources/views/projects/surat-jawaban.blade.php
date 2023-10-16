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
                <h1 class="page-title">Upload Surat</h1>
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
                            <form method="POST" action="{{ route('projects.surat-jawaban-submit', $data->id) }}" enctype="multipart/form-data" class="swa-confirm">
                                @csrf
                                <input type="hidden" name="project_id" value="{{ $data->id }}" readonly>
                                <div class="row">
                                    <div class="col-xl-12 col-md-12 col-sm-12">
                                        <div class="form-group">
                                            <label for="spk_no" class="form-label">NIB</label>
                                            <input type="text" class="form-control" id="spk_no" autocomplete="off" name="spk_no" value="{{$data->nib}}" disabled>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-xl-12 col-md-12 col-sm-12">
                                        <div class="form-group">
                                            <label for="spk_no" class="form-label">NPWP</label>
                                            <input type="text" class="form-control" id="spk_no" autocomplete="off" name="spk_no" value="{{$data->npwp}}" disabled>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xl-12 col-md-12 col-sm-12">
                                        <div class="form-group">
                                            <label for="spk_no" class="form-label">Nama Perusahaan</label>
                                            <input type="text" class="form-control" autocomplete="off" name="spk_no" value="{{ $data->nama_perusahaan }}" disabled>
                                        </div>
                                    </div>
                                <div class="row">
                                    <div class="col-xl-12 col-md-12 col-sm-12">
                                        <div class="form-group">
                                            <label for="spk_no" class="form-label">Kode Produk</label>
                                            <input type="text" class="form-control" id="spk_no" autocomplete="off" name="spk_no" value="{{$data->kd_produk}}" disabled>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-xl-12 col-md-12 col-sm-12">
                                        <div class="form-group">
                                            <label for="spk_no" class="form-label">Nama CP</label>
                                            <input type="text" class="form-control" id="spk_no" autocomplete="off" name="spk_no" value="{{$data->nama_cp}}" disabled>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-xl-12 col-md-12 col-sm-12">
                                        <div class="form-group">
                                            <label for="spk_no" class="form-label">Jabatan CP</label>
                                            <input type="text" class="form-control" id="spk_no" autocomplete="off" name="spk_no" value="{{$data->jabatan_cp}}" disabled>
                                        </div>
                                    </div>
                                </div>

                                <div class="card custom-card">
                                    <div class="card-header border-bottom">
                                        <h3 class="card-title">Uploaded Document</h3>
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
                                                    @foreach ($data->files as $file)
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
                                <div class="row">
                                    <div class="col-xl-12 col-md-12 col-sm-12">
                                        <div class="form-group">
                                            <label for="" class="form-label">Surat Jawaban</label>
                                            <input class="form-control" type="file" id="formFileMultiple" autocomplete="off" name="surat_jawaban" accept="application/msword, application/vnd.ms-excel, text/plain, application/pdf" required>
                                        </div>
                                    </div>
                                    <div class="col-xl-12 col-md-12 col-sm-12">
                                        <div class="form-group">
                                            <label for="" class="form-label">Surat Penyesuaian</label>
                                            <input class="form-control" type="file" id="formFileMultiple" autocomplete="off" name="surat_penyesuaian" accept="application/msword, application/vnd.ms-excel, text/plain, application/pdf" required>
                                        </div>
                                    </div>
                                    <div class="form-upload">
                                        <div class="surat-pendukung">
                                            <div class="form-group">
                                                <label for="" class="form-label">Surat Pendukung</label>
                                                <div class="d-flex justify-content-between">
                                                    <input class="form-control col-11" type="file" id="formFileMultiple" autocomplete="off" name="surat_pendukung[]" accept="application/msword, application/vnd.ms-excel, text/plain, application/pdf" required>
                                                    <a href="#" class="btn btn-danger remove_field col-1" style="width:100px">Remove</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <a class="add_field_button btn btn-info col-2" style="margin-left: 12px;">Add Surat Pendukung</a><br>
                                    <div class="col-xl-12 col-md-12 col-sm-12">
                                        <div class="form-group">
                                            <label for="" class="form-label">Alasan</label>
                                            <textarea class="form-control" name="note"></textarea>
                                        </div>
                                    </div>
                                </div>
                                <button type="submit" class="btn btn-primary mt-4 mb-0">Submit</button>
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
@section('custom-js')
    <script>
        $("form.swa-confirm").submit(function (e) {
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
        })

            $(document).ready(function() {
                var max_fields = 10; //maximum input boxes allowed
                var wrapper = $(".form-upload"); //Fields wrapper
                var add_button = $(".add_field_button"); //Add button ID

                var x = 1; //initlal text box count
                $(add_button).on("click", function(e) { //on add input button click
                    $(this).prev().find('div').first().clone().appendTo($(this).prev())
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
                    console.log($(this).parents('div.surat-pendukung'))
                    $(this).parents('div.surat-pendukung').remove();
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