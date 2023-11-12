@extends('layouts.app')
@section('title', $title)
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
                <h1 class="page-title">Pilih Asesor & QC</h1>
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
                            <form method="POST" action="{{ route('requests.select-assessor-submit', $data->id) }}" enctype="multipart/form-data">
                                @csrf
                                @method('PUT')
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
                                <div class="row">
                                    <div class="col-xl-12 col-md-12 col-sm-12">
                                        <div class="form-group">
                                            <label for="spk_no" class="form-label">Nama Perusahaan</label>
                                            <input type="text" class="form-control" autocomplete="off" name="spk_no" value="{{ $data->nama_perusahaan }}" disabled>
                                        </div>
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

                                <div class="row">
                                    <div class="col-6">
                                        <div class="form-group">
                                                <label for="" class="form-label">Asesor</label>
                                                <select class="form-control select-search" name="asesor[]" multiple required data-placeholder="Pilih Asesor">
                                                    @foreach ($user->where('role_id', 3) as $asesor)
                                                        <option value="{{ $asesor->id }}" {{in_array($asesor->id, $data->asesors->pluck('asesor')->all()) ? 'selected':''}}>{{ $asesor->name }}</option>
                                                    @endforeach
                                                </select>
                                        </div>
                                    </div>
                                    <div class="col-6">
                                        <div class="form-group">
                                                <label for="" class="form-label">QC</label>
                                                <select class="form-control select-search" name="qc[]" multiple required data-placeholder="Pilih QC">
                                                    @foreach ($user->where('role_id', 6) as $qc)
                                                        <option value="{{ $qc->id }}" {{in_array($qc->id, $data->qc->pluck('qc')->all()) ? 'selected':''}}>{{ $qc->name }}</option>
                                                    @endforeach
                                                </select>
                                        </div>
                                    </div>
                                </div>
                                @if ($data->status == 101)
                                
                                <div class="card-header">
                                    <h3 class="card-title">Tipe Produk</h3>
                                </div>
                                <div class="card-body">
                                <div class="form-upload">
                                <div class="row product_type">
                                    <div class="col-3">
                                        <div class="form-group">
                                            <label for="" class="form-label">Kode HS</label>
                                            <input class="form-control" name="kode_hs[]" required>
                                        </div>
                                    </div>
                                    <div class="col-4">
                                        <div class="form-group">
                                            <label for="" class="form-label">Tipe Produk</label>
                                            <input class="form-control" name="tipe_produk[]" required>
                                        </div>
                                    </div>
                                    <div class="col-4">
                                        <div class="form-group">
                                            <label for="" class="form-label">Spesifikasi</label>
                                            <textarea class="form-control" name="spesifikasi[]" required></textarea>
                                        </div>
                                    </div>
                                    <div class="col-1">
                                        <div class="form-group">
                                            <label for="spk_no" class="form-label">&nbsp;</label>
                                            <a href="#" class="btn btn-danger remove_field" style="width:100px">Remove</a>
                                        </div>
                                    </div>
                                </div>
                                </div>
                                <a class="add_field_button btn btn-info">Add More</a><br>
                                </div>
                                @endif
                                <div class="row">
                                    <div class="col-xl-12 col-md-12 col-sm-12">
                                        <div class="form-group">
                                            <label for="" class="form-label">Surat Tugas</label>
                                            <input class="form-control" type="file" id="formFileMultiple" autocomplete="off" name="surat_tugas" accept="application/msword, application/vnd.ms-excel, application/vnd.ms-powerpoint, text/plain, application/pdf, image/*" required>
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
        $(document).ready(function() {
            var max_fields = 10; //maximum input boxes allowed
            var wrapper = $(".form-upload"); //Fields wrapper
            var add_button = $(".add_field_button"); //Add button ID

            var x = 1; //initlal text box count
            $(add_button).on("click", function(e) { //on add input button click
                // $(this).prev().find('div').first().clone().appendTo($(this).prev())
                let clone = $(this).prev().find('div.row').first().clone()
                clone.find('input').val('')
                clone.appendTo($(this).prev())
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
                $(this).parents('div.product_type').remove();
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