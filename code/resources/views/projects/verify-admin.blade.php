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
                            <form method="POST" action="{{ route('projects.verify-admin-submit', $project->id) }}" enctype="multipart/form-data">
                                @csrf
                                <input type="hidden" name="project_id" value="{{ $project->id }}" readonly>
                                <div class="row">
                                <div class="col-6">
                                    <div class="col-xl-12 col-md-12 col-sm-12">
                                        <div class="form-group">
                                            <label for="spk_no" class="form-label">NIB</label>
                                            <input type="text" class="form-control" id="spk_no" autocomplete="off" name="spk_no" placeholder="Enter SPK Number" value="{{$data->nib}}" disabled>
                                        </div>
                                    </div>

                                    <div class="col-xl-12 col-md-12 col-sm-12">
                                        <div class="form-group">
                                            <label for="spk_no" class="form-label">NPWP</label>
                                            <input type="text" class="form-control" id="spk_no" autocomplete="off" name="spk_no" placeholder="Enter SPK Number" value="{{$data->npwp}}" disabled>
                                        </div>
                                    </div>

                                    <div class="col-xl-12 col-md-12 col-sm-12">
                                        <div class="form-group">
                                            <label for="spk_no" class="form-label">Kode Produk</label>
                                            <input type="text" class="form-control" id="spk_no" autocomplete="off" name="spk_no" placeholder="Enter SPK Number" value="{{$data->kd_produk}}" disabled>
                                        </div>
                                    </div>

                                    <div class="col-xl-12 col-md-12 col-sm-12">
                                        <div class="form-group">
                                            <label for="spk_no" class="form-label">Nomer Berkas</label>
                                            <input type="text" class="form-control" id="spk_no" autocomplete="off" name="spk_no" placeholder="Enter SPK Number" value="{{$data->no_berkas}}" disabled>
                                        </div>
                                    </div>

                                    <div class="col-xl-12 col-md-12 col-sm-12">
                                        <div class="form-group">
                                            <label for="spk_no" class="form-label">Alamat Kantor</label>
                                            <input type="text" class="form-control" id="spk_no" autocomplete="off" name="spk_no" placeholder="Enter SPK Number" value="{{$data->alamat_kantor}}" disabled>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-6">
                                    <div class="col-xl-12 col-md-12 col-sm-12">
                                        <div class="form-group">
                                            <label for="spk_no" class="form-label">Nama CP</label>
                                            <input type="text" class="form-control" id="spk_no" autocomplete="off" name="spk_no" placeholder="Enter SPK Number" value="{{$data->nama_cp}}" disabled>
                                        </div>
                                    </div>

                                    <div class="col-xl-12 col-md-12 col-sm-12">
                                        <div class="form-group">
                                            <label for="spk_no" class="form-label">No HP CP</label>
                                            <input type="text" class="form-control" id="spk_no" autocomplete="off" name="spk_no" placeholder="Enter SPK Number" value="{{$data->no_hp_cp}}" disabled>
                                        </div>
                                    </div>

                                    <div class="col-xl-12 col-md-12 col-sm-12">
                                        <div class="form-group">
                                            <label for="spk_no" class="form-label">Email CP</label>
                                            <input type="text" class="form-control" id="spk_no" autocomplete="off" name="spk_no" placeholder="Enter SPK Number" value="{{$data->email_cp}}" disabled>
                                        </div>
                                    </div>

                                    <div class="col-xl-12 col-md-12 col-sm-12">
                                        <div class="form-group">
                                            <label for="spk_no" class="form-label">Jabatan CP</label>
                                            <input type="text" class="form-control" id="spk_no" autocomplete="off" name="spk_no" placeholder="Enter SPK Number" value="{{$data->jabatan_cp}}" disabled>
                                        </div>
                                    </div>
                                    
                                    <div class="col-xl-12 col-md-12 col-sm-12">
                                        <div class="form-group">
                                            <label for="spk_no" class="form-label">Alamat Pabrik</label>
                                            <input type="text" class="form-control" id="spk_no" autocomplete="off" name="spk_no" placeholder="Enter SPK Number" value="{{$data->alamat_pabrik}}" disabled>
                                        </div>
                                    </div>
                                </div>
                                </div>
                                <div class="row">
                                    <div class="col-12">
                                    <button class="btn btn-primary" type="button" data-bs-toggle="collapse" data-bs-target="#collapseProduk" aria-expanded="false" aria-controls="collapseProduk">
                                        Produk
                                    </button>
                                    <table class="table table-hover collapse "id="collapseProduk">
                                        @forelse (collect($data->produk)->flatten() as $item)
                                            <tr>
                                                <td width="30%">Produk</td>
                                                <td width="1%">:</td>
                                                <td>{{$item}}</td>
                                            </tr>
                                        @empty
                                            <tr>
                                                <td colspan="3">Tidak ada produk.</td>
                                            </tr>
                                        @endforelse
                                    </table>
                                    </div>
                                    <br><br><br>
                                    <div class="col-12">
                                        <button class="btn btn-primary" type="button" data-bs-toggle="collapse" data-bs-target="#collapseMesin" aria-expanded="false" aria-controls="collapseMesin">
                                        Mesin
                                    </button>
                                    <table class="table table-hover collapse "id="collapseMesin">
                                        @forelse ($data->mesin as $item)
                                            @foreach ($item as $key => $item)
                                                <tr>
                                                    <td width="30%">{{Str::headline($key)}}</td>
                                                    <td width="1">:</td>
                                                    <td>{{$item}}</td>
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
                                <br>
                                <div class="row">
                                    <div class="col-12">
                                    <button class="btn btn-primary" type="button" data-bs-toggle="collapse" data-bs-target="#collapseNaker" aria-expanded="false" aria-controls="collapseNaker">
                                        Tenaga Kerja
                                    </button>
                                    <table class="table table-hover collapse "id="collapseNaker">
                                            @forelse ($data->naker as $item)
                                                @foreach ($item as $key => $item)
                                                    <tr>
                                                        <td width="30%">{{Str::headline($key)}}</td>
                                                        <td width="1">:</td>
                                                        <td>{{$item}}</td>
                                                    </tr>
                                                @endforeach
                                            @empty
                                                <tr>
                                                    <td colspan="3">Tidak ada produk.</td>
                                                </tr>
                                            @endforelse
                                        </table>
                                    </div>
                                    <br><br><br>
                                    <div class="col-12">
                                    <button class="btn btn-primary" type="button" data-bs-toggle="collapse" data-bs-target="#collapseProduksi" aria-expanded="false" aria-controls="collapseProduksi">
                                        Produksi
                                    </button>
                                    <table class="table table-hover collapse "id="collapseProduksi">
                                        @forelse ($data->produksi as $item)
                                            @foreach ($item as $key => $item)
                                                <tr>
                                                    <td width="30%">{{Str::headline($key)}}</td>
                                                    <td width="1">:</td>
                                                    <td>{{$item}}</td>
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
                                <br>
                                <div class="row">
                                    <div class="col-12">
                                        <button class="btn btn-primary" type="button" data-bs-toggle="collapse" data-bs-target="#collapseKapasitas" aria-expanded="false" aria-controls="collapseKapasitas">
                                        Kapasitas
                                    </button>
                                    <table class="table table-hover collapse "id="collapseKapasitas">
                                        @forelse ($data->kapasitas as $item)
                                            @foreach ($item as $key => $item)
                                                <tr>
                                                    <td width="30%">{{Str::headline($key)}}</td>
                                                    <td width="1">:</td>
                                                    <td>{{$item}}</td>
                                                </tr>
                                            @endforeach
                                        @empty
                                            <tr>
                                                <td colspan="3">Tidak ada produk.</td>
                                            </tr>
                                        @endforelse
                                    </table>
                                    </div>
                                    <br><br><br>
                                    <div class="col-12">
                                        <button class="btn btn-primary" type="button" data-bs-toggle="collapse" data-bs-target="#collapseBahanBaku" aria-expanded="false" aria-controls="collapseBahanBaku">
                                        Bahan Baku
                                    </button>
                                    <table class="table table-hover collapse "id="collapseBahanBaku">
                                        @forelse ($data->bahan_baku as $item)
                                            @foreach ($item as $key => $item)
                                                <tr>
                                                    <td width="30%">{{Str::headline($key)}}</td>
                                                    <td width="1">:</td>
                                                    <td>{{$item}}</td>
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
                                <br>
                                <div class="row">
                                    <div class="col-6">
                                        <button class="btn btn-primary" type="button" data-bs-toggle="collapse" data-bs-target="#collapseBahanPenolong" aria-expanded="false" aria-controls="collapseBahanPenolong">
                                        Bahan Penolong
                                    </button>
                                    <table class="table table-hover collapse "id="collapseBahanPenolong">
                                        @forelse ($data->bahan_penolong as $item)
                                            @foreach ($item as $key => $item)
                                                <tr>
                                                    <td width="30%">{{Str::headline($key)}}</td>
                                                    <td width="1">:</td>
                                                    <td>{{$item}}</td>
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
                                {{-- <button type="submit" name="action" value="1" class="btn btn-primary mt-4 mb-0">Terima</button> --}}
                                <button type="submit" name="action" value="2" class="btn btn-success mt-4 mb-0">Terima</button>
                                <button type="submit" name="action" value="0" class="btn btn-danger mt-4 mb-0 tolak">Tolak</button>
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
@section('js')
<script>
        $( document ).on( 'click', '.tolak', function (e) {
            e.preventDefault();
            e.stopPropagation();
            
            swal({
                title: "",
                text: '<textarea class="form-control" name="note" id="note"></textarea>',
                html: true,
                customClass: 'swal-wide',
                showCancelButton: true,
                confirmButtonColor: '#8CD4F5',
                // cancelButtonColor: '#000!important',
                confirmButtonText: 'Submit',
                closeOnConfirm: false,
                closeOnCancel: false,
            },
            function(isConfirm){
            if (isConfirm) {
                var fd = new FormData();
                fd.append( '_token', '{{ csrf_token() }}' );
                fd.append( 'project_id', '{{ $project->id }}' );
                fd.append( 'action', 0 );
                fd.append( 'alasan_tolak', document.getElementById('note').value );
                $.ajax({
                    url: '{{ route("projects.verify-admin-submit", $project->id) }}',
                    headers: {'X-CSRF-TOKEN': '{{ csrf_token() }}'},
                    type: 'POST',
                    data: fd,
                    cache: false,
                    processData: false,
                    contentType: false,
                }).done(function(res) {
                    swal("Submited", "", "success");
                    window.location.href = "/projects";
                });
            } else {
                swal("Cancelled", "", "error");
            }
            });
            return false;        
        });
    </script>
@endsection