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
                <h1 class="page-title">Dashboard</h1>
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
                            <div class="card-options">
                                <div class="btn-group" style="margin-right: 8px">
                                    <a class="btn btn-primary" data-bs-target="#addIp" data-bs-toggle="modal">
                                        <li class="fa fa-plus"></li>
                                        Add IP
                                    </a>
                                </div>
                            </div>
                        </div>
                        <div class="card-body">
                            <table id="basic-datatable" class="table table-bordered text-wrap key-buttons border-bottom text-center datatable" style="width:100%">
                                <thead>
                                    <tr>
                                        <th class="border-bottom-0 filter">No</th>
                                        <th class="border-bottom-0 filter">IP</th>
                                        <th class="border-bottom-0 filter">Last Access</th>
                                        <th class="border-bottom-0 filter">Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    @foreach ($data as $item)
                                    <tr>
                                        <td>{{ $loop->iteration }}</td>
                                        <td>{{ $item->ip }}</td>
                                        <td>{{ $item->updated_at->diffForHumans() }}</td>
                                        <td>
                                            <form action="{{ route('whitelist-ip.update', $item->id) }}" method="POST">
                                                @csrf
                                                @method("PUT")
                                                @if ($item->status)
                                                    <button type="submit" class="btn btn-success">Allow</button>
                                                @else
                                                    <button type="submit" class="btn btn-danger">Disallow</button>
                                                @endif
                                            </form>
                                        </td>
                                    </tr>
                                    @endforeach
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        <!-- CONTAINER END -->
    </div>
    <div class="modal fade" id="addIp">
        <div class="modal-dialog" role="document">
            <form method="POST" enctype="multipart/form-data" action="{{ route('whitelist-ip.store') }}">
            <div class="modal-content modal-content-demo">
                <div class="modal-header">
                    <h6 class="modal-title">Add IP</h6><button aria-label="Close" class="btn-close" data-bs-dismiss="modal"><span aria-hidden="true">&times;</span></button>
                </div>
                <div class="modal-body">
                        @csrf
                        <div class="col-12">
                            <div class="form-group">
                                <div class="form-group">
                                    <label for="file" class="form-label">IP</label>
                                    <input class="form-control" type="text" autocomplete="off" name="ip" required>
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
@endsection
@section('js')
<script src="{{asset('assets/plugins/leaflet/leaflet.js')}}"></script>
<script src='https://cdn.jsdelivr.net/npm/leaflet-sidebar-v2@3.1.1/js/leaflet-sidebar.min.js'></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/leaflet-sidebar-v2@3.1.1/css/leaflet-sidebar.min.css">
@endsection