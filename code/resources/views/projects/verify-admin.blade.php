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
                                {!! $data !!}
                                {{-- <button type="submit" name="action" value="1" class="btn btn-primary mt-4 mb-0">Terima</button> --}}
                                <button type="submit" name="action" value="2" class="btn btn-success mt-4 mb-0">Terima Tidak Lengkap</button>
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
                text: '<textarea class="form-control" name="note"></textarea>',
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