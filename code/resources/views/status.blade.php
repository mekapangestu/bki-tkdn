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
                <h1 class="page-title">IP Whitelist</h1>
                <div>
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="javascript:void(0)">Home</a></li>
                        <li class="breadcrumb-item active" aria-current="page">IP Whitelist</li>
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
                            <div class="card-options">
                                <div class="btn-group" style="margin-right: 8px">
                                    {{-- <a class="btn btn-primary" data-bs-target="#addIp" data-bs-toggle="modal">
                                        <li class="fa fa-plus"></li>
                                        Add Status
                                    </a> --}}
                                </div>
                            </div>
                        </div>
                        <div class="card-body">
                            <table id="basic-datatable" class="table table-bordered text-wrap key-buttons border-bottom text-center datatable" style="width:100%">
                                <thead>
                                    <tr>
                                        <th class="border-bottom-0 filter">No</th>
                                        <th class="border-bottom-0 filter">ID Siinas</th>
                                        <th class="border-bottom-0 filter">Name</th>
                                        <th class="border-bottom-0 filter">Status</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    @foreach ($data as $item)
                                    <tr>
                                        <td>{{ $loop->iteration }}</td>
                                        <td>{{ $item->id }}</td>
                                        <td>{{ $item->name }}</td>
                                        <td>{{ $item->updated_at->diffForHumans() }}</td>
                                        <td>
                                            <a class="btn btn-primary" data-bs-target="#edit{{$item->id}}" data-bs-toggle="modal">
                                                Edit
                                            </a>
                                        </td>
                                    </tr>
                                    <div class="modal fade" id="edit{{$item->id}}">
                                        <div class="modal-dialog" role="document">
                                            <form method="POST" enctype="multipart/form-data" action="{{ route('status.update', $item->id) }}">
                                            @csrf
                                            @method('PUT')
                                            <div class="modal-content modal-content-demo">
                                                <div class="modal-header">
                                                    <h6 class="modal-title">Edit</h6><a aria-label="Close" class="btn-close" data-bs-dismiss="modal"><span aria-hidden="true">&times;</span></a>
                                                </div>
                                                <div class="modal-body">
                                                        @csrf
                                                        <div class="col-12">
                                                            <div class="form-group">
                                                                <div class="form-group">
                                                                    <label for="file" class="form-label">Name</label>
                                                                    <input class="form-control" type="text" autocomplete="off" name="name" required value="{{$item->name}}">
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="modal-footer">
                                                        <button class="btn btn-primary">Submit</button> <a class="btn btn-light" data-bs-dismiss="modal">Cancel</a>
                                                    </div>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                    @endforeach
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        <!-- CONTAINER END -->
    </div>
@endsection
@section('js')
<script src="{{asset('assets/plugins/leaflet/leaflet.js')}}"></script>
<script src='https://cdn.jsdelivr.net/npm/leaflet-sidebar-v2@3.1.1/js/leaflet-sidebar.min.js'></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/leaflet-sidebar-v2@3.1.1/css/leaflet-sidebar.min.css">
@endsection