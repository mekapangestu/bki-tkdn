@extends('layouts.app')
@section('title', 'Profile')
@section('content')
    <style>
        .datepicker {
            z-index: 10009 !important
        }
    </style>
    <div class="side-app">
        <!-- CONTAINER -->
        <div class="main-container container-fluid">

            <!-- PAGE-HEADER -->
            <div class="page-header">
                <h1 class="page-title">Edit Profile</h1>
                <div>
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="javascript:void(0)">Pages</a></li>
                        <li class="breadcrumb-item active" aria-current="page">Edit Profile</li>
                    </ol>
                </div>
            </div>
            <!-- PAGE-HEADER END -->

            <!-- ROW-1 OPEN -->
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
                <div class="col-xl-4">
                    <div class="card">
                        <div class="card-header">
                            <div class="card-title">Edit Password</div>
                        </div>
                        <div class="card-body">
                            <div class="text-center chat-image mb-5">
                                <div class="avatar avatar-xxl chat-profile mb-3 brround">
                                    <a class="" href="profile.html"><img alt="avatar" src="{{ asset('assets/images/149071.png') }}" class="brround"></a>
                                </div>
                                <div class="main-chat-msg-name">
                                    <a href="{{ route('profile') }}">
                                        <h5 class="mb-1 text-dark fw-semibold">{{ $user->name }}</h5>
                                    </a>
                                    <p class="text-muted mt-0 mb-0 pt-0 fs-13">Superadmin</p>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="form-label">Current Password</label>
                                <div class="wrap-input100 validate-input input-group" id="Password-toggle">
                                    <a href="javascript:void(0)" class="input-group-text bg-white text-muted">
                                        <i class="zmdi zmdi-eye text-muted" aria-hidden="true"></i>
                                    </a>
                                    <input class="input100 form-control" type="password" placeholder="Current Password" value="000000000000" autocomplete="current-password">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="form-label">New Password</label>
                                <div class="wrap-input100 validate-input input-group" id="Password-toggle1">
                                    <a href="javascript:void(0)" class="input-group-text bg-white text-muted">
                                        <i class="zmdi zmdi-eye text-muted" aria-hidden="true"></i>
                                    </a>
                                    <input class="input100 form-control" type="password" placeholder="New Password" autocomplete="new-password">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="form-label">Confirm Password</label>
                                <div class="wrap-input100 validate-input input-group" id="Password-toggle2">
                                    <a href="javascript:void(0)" class="input-group-text bg-white text-muted">
                                        <i class="zmdi zmdi-eye text-muted" aria-hidden="true"></i>
                                    </a>
                                    <input class="input100 form-control" type="password" placeholder="Confirm Password" autocomplete="new-password">
                                </div>
                            </div>
                        </div>
                        <div class="card-footer text-end">
                            <a href="javascript:void(0)" class="btn btn-primary">Update</a>
                            <a href="javascript:void(0)" class="btn btn-danger">Cancel</a>
                        </div>
                    </div>
                </div>
                <div class="col-xl-8">
                    <div class="card">
                        <form method="POST" action="{{ route('profile.update', auth()->user()->id) }}" enctype="multipart/form-data">
                            @csrf
                            @method('PUT')
                            {{-- @method('PUT') --}}
                            <div class="card-header">
                                <h3 class="card-title">Edit Profile</h3>
                            </div>
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-6">
                                        <div class="form-group">
                                            <label for="exampleInputname">Name</label>
                                            <input type="hidden" class="form-control" id="user_id" name="user_id" value="{{ $user->id }}">
                                            <input type="text" class="form-control" id="name" name="name" value="{{ $user->name ?? '' }}" placeholder="First Name">
                                        </div>
                                    </div>
                                    <div class="col-6">
                                        <div class="form-group">
                                            <label for="exampleInputEmail1">Email</label>
                                            <input type="email" class="form-control" id="email" name="email" value="{{ $user->email ?? '' }}" placeholder="Email address">
                                        </div>
                                    </div>
                                    <div class="col-6">
                                        <div class="form-group">
                                            <label for="exampleInputnumber">Contact Number</label>
                                            <input type="text" class="form-control" id="contact" name="contact" value="{{ $user->contact ?? '' }}" placeholder="Contact number">
                                        </div>
                                    </div>
                                    <div class="col-6">
                                        <div class="form-group">
                                            <label for="exampleInputnumber">Position</label>
                                            <input type="text" class="form-control" id="jabatan" name="jabatan" value="{{ $detail->jabatan ?? '' }}" placeholder="Position">
                                        </div>
                                    </div>
                                    {{-- <div class="col-6">
                                        <div class="form-group">
                                            <label for="type" class="form-label">Type</label>
                                            <select class="form-control form-select select2" name="category">
                                                <option selected disabled>- Pilih Bidang Keahlian -</option>
                                                @foreach ($type as $val)
                                                    @if (empty($detail))
                                                        <option value="{{ $val->cat_id }}">{{ $val->cat_name }}</option>
                                                    @else
                                                        <option value="{{ $val->cat_id }}" selected>{{ $val->cat_name }}</option>
                                                    @endif
                                                @endforeach
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-6">
                                        <div class="form-group">
                                            <label for="" class="form-label">Sertifikat Keahlian</label>
                                            <input class="form-control" type="file" id="formFileMultiple" autocomplete="off" name="cert_skill" accept="application/pdf">
                                        </div>
                                    </div>
                                    <div class="col-6">
                                        <label for="" class="form-label">Tanggal Expired</label>
                                        <div class="input-group">
                                            <div class="input-group-text">
                                                <i class="fa fa-calendar text-white"></i>
                                            </div>
                                            <input class="form-control" id="datepicker-start" autocomplete="off" placeholder="Enter Start Date" type="text" name="expired_date" value="{{ $detail->expired_date ?? '' }}">
                                        </div>
                                    </div> --}}
                                </div>
                            </div>
                            <div class="card-footer text-end">
                                <button type="submit" class="btn btn-primary y-1">Update</button>
                                <a href="{{ url()->previous() }}" class="btn btn-danger my-1">Cancel</a>
                            </div>
                        </form>
                    </div>
                    {{-- <div class="card">
                        <div class="card-header">
                            <h3 class="card-title">Additional Info</h3>
                            <div class="card-options">
                                @role('superadmin|marketing-admin|operation-admin|manager|inspektor|kepala-produksi')
                                    <div class="btn-group" style="margin-right: 8px">
                                        <a class="btn btn-success text-white" data-bs-target="#tambahSertifikasi" data-bs-toggle="modal">
                                            <li class="fa fa-plus"></li>
                                            Tambah
                                        </a>
                                    </div>
                                @endrole
                            </div>
                        </div>
                        <div class="card-body">
                            <div class="row">
                                <div class="col-6">
                                    <div class="form-group">
                                        <label for="exampleInputname">NUP</label>
                                        <input type="text" class="form-control" id="nup" name="nup" value="{{ $detail->nup }}" placeholder="First Name" disabled>
                                    </div>
                                </div>
                                <div class="col-6">
                                    <div class="form-group">
                                        <label for="exampleInputEmail1">Jabatan</label>
                                        <input type="email" class="form-control" id="email" name="email" value="{{ $user->jabatan }}" placeholder="Email address" disabled>
                                    </div>
                                </div>
                                <div class="col-6">
                                    <div class="form-group">
                                        <label for="exampleInputnumber">Kode Departemen</label>
                                        <input type="text" class="form-control" id="contact" name="contact" value="{{ $user->kode_departemen }}" placeholder="Contact number" disabled>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div> --}}
                    @role('marketing-admin|marketing-admin|operation-admin|inspektor|manager|koordinator|kepala-produksi')
                        <div class="card">
                            {{-- @method('PUT') --}}
                            <div class="card-header">
                                <h3 class="card-title">Daftar Sertifikasi Keahlian</h3>
                                <div class="card-options">
                                    @role('superadmin|marketing-admin|operation-admin|manager|inspektor|kepala-produksi')
                                        <div class="btn-group" style="margin-right: 8px">
                                            <a class="btn btn-success text-white" data-bs-target="#tambahSertifikasi" data-bs-toggle="modal">
                                                <li class="fa fa-plus"></li>
                                                Tambah
                                            </a>
                                        </div>
                                    @endrole
                                </div>
                            </div>
                            <div class="card-body">
                                <?php $i = 1; ?>
                                @forelse ($cert as $data)
                                    <div class="row pb-6" style="display: flex; align-items: center; justify-content: center;">
                                        <div class="col-1">
                                            <h1 style="font-weight: bolder; text-align: center"><?= $i ?></h1>
                                        </div>
                                        <div class="col-7">
                                            <h5 style="font-weight: bold">{{ $data->cert_title }}</h5>
                                            <h6 style="font-style: italic">{{ $data->description }}</h6>
                                            <span style="font-weight: 700">{{ $data->expired_date }}</span>
                                        </div>
                                        <div class="col-4" style="text-align: right; vertical-align: middle">
                                            <form method="POST" action="{{ route('delete.cert', $data->id) }}">
                                                <a class="btn btn-success text-white" data-bs-target="#ubahSertifikasi-{{ $data->id }}" data-bs-toggle="modal">
                                                    <li class="fa fa-edit"></li>
                                                </a>
                                                <a class="btn btn-danger text-white" data-bs-target="#tambahSertifikasi" data-bs-toggle="modal">
                                                    <li class="fa fa-trash"></li>
                                                </a>
                                            </form>
                                        </div>
                                    </div>
                                    <?php $i++; ?>
                                @empty
                                    <div class="row pb-6" style="display: flex; align-items: center; justify-content: center;">
                                        <h3>-No Data-</h3>
                                    </div>
                                @endforelse
                            </div>
                        </div>
                    @endrole
                </div>
            </div>
            <!-- ROW-1 CLOSED -->

        </div>
        <!--CONTAINER CLOSED -->
    </div>

    @role('marketing-admin|marketing-admin|operation-admin|inspektor|manager|koordinator|kepala-produksi')
        <div class="modal fade" id="tambahSertifikasi">
            <div class="modal-dialog" role="document">
                <div class="modal-content modal-content-demo">
                    <div class="modal-header">
                        <h6 class="modal-title">Tambah Sertifikasi</h6><button aria-label="Close" class="btn-close" data-bs-dismiss="modal"><span aria-hidden="true">&times;</span></button>
                    </div>
                    <div class="modal-body">
                        <form id="addCert" method="POST" action="{{ route('store.cert') }}" class="from-prevent-multiple-submits">
                            @csrf
                            <div class="col-12">
                                <div class="form-group">
                                    <label for="exampleInputname">Certification Title</label>
                                    <input type="text" class="form-control" id="cert_title" name="cert_title" placeholder="Nama Sertifikat" required>
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputname">Description</label>
                                    <textarea class="form-control" id="description" name="description" placeholder="Deskripsi" required></textarea>
                                </div>
                                <div class="form-group">
                                    <label for="expired_date" class="form-label">Expired Date</label>
                                    <input type="text" class="form-control fc-datepicker" id="expired_date" name="expired_date" placeholder="Enter Expired Date" required>
                                </div>
                            </div>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button class="btn btn-primary from-prevent-multiple-submits" form="addCert">Submit</button> <button class="btn btn-light" data-bs-dismiss="modal">Cancel</button>
                    </div>
                </div>
            </div>
        </div>

        @foreach ($cert as $data)
            <div class="modal fade" id="ubahSertifikasi-{{ $data->id }}">
                <div class="modal-dialog" role="sertifikasi">
                    <div class="modal-content modal-content-demo">
                        <div class="modal-header">
                            <h6 class="modal-title">Edit Sertifikasi</h6><button aria-label="Close" class="btn-close" data-bs-dismiss="modal"><span aria-hidden="true">&times;</span></button>
                        </div>
                        <div class="modal-body">
                            <form id="editCert" method="POST" action="{{ route('update.cert', $data->id) }}">
                                @csrf
                                @method('PUT')
                                <div class="col-12">
                                    <div class="form-group">
                                        <label for="exampleInputname">Nama Sertifikat</label>
                                        <input type="text" class="form-control" id="cert_title" name="cert_title" placeholder="Nama Sertifikat" value="{{ $data->cert_title }}">
                                    </div>
                                    <div class="form-group">
                                        <label for="exampleInputname">Deskripsi</label>
                                        <textarea class="form-control" id="description" name="description" placeholder="Deskripsi">{{ $data->description }}</textarea>
                                    </div>
                                    <div class="form-group">
                                        <label for="expired_date" class="form-label">Expired Date</label>
                                        <input type="text" class="form-control fc-datepicker" id="expired_date" autocomplete="off" name="expired_date" placeholder="Enter Expired Date" value="{{ $data->expired_date }}">
                                    </div>
                                </div>
                        </div>
                        </form>
                        <div class="modal-footer">
                            <button class="btn btn-primary" form="editCert">Submit</button> <button class="btn btn-light" data-bs-dismiss="modal">Cancel</button>
                        </div>
                    </div>
                </div>
            </div>
        @endforeach
    @endrole

@endsection
@section('custom-js')
    <script>
        // let totalAllValue = 0
        // let totalAllBoq = []
        $('#sosModal').on('shown.bs.modal', function(e) {
            let totalValue = 0
            $('input:checkbox.checkbox_check:checked').each(function() {
                if (Number.isInteger($(this).parents('tr').find('.currency')[0].value)) {
                    totalValue += Number($(this).parents('tr').find('.currency')[0].value);
                } else {
                    totalValue += Number($(this).parents('tr').find('.currency')[0].value.replace(/[^0-9]/g, ''));
                }
            });
            // totalValue = totalAllValue?totalAllValue:totalValue
            $('#value').val(totalValue).maskMoney('mask');
        })

        $(document).on('change', 'input', function(e) {
            if ($('[name="boq_id[]"]:checked').length > 0) {
                $('#addSOS').removeClass("disabled")
            } else {
                $('#addSOS').addClass("disabled")
            }

            if ($('[name="boq_id[]"]').not(":disabled").length > $('[name="boq_id[]"]:checked').not(":disabled").length) {
                $('#checkAll').prop("checked", this.checked);
            } else {
                $('#checkAll').prop("checked", this.checked);
            }
        });

        $(document).on('change', '#checkAll', function() {
            $('td input[type="checkbox"]').not(":disabled").prop("checked", this.checked).change();
        });

        // let table = $('#datatable').DataTable({
        //     stateSave: true,
        //     language: {
        //         searchPlaceholder: 'Search...',
        //         scrollX: "100%",
        //         sSearch: '',
        //     },
        //     columnDefs: [
        //         { "orderable": false, "targets": [0] }
        //     ]
        // });

        // $('#checkAll').change(function(){
        //     var rows,checked;  
        //     var rows = $("#datatable").DataTable().$('tr', {"filter": "applied"});// viewlist is
        //     checked = $(this).prop('checked');
        //     $.each(rows, function () {
        //         var checkbox = $($(this).find('td').eq(0)).find('input').not(":disabled").prop('checked', checked);
        //         if (checked) {
        //             totalAllValue += $($(this).find('td').eq(0)).find('input').not(":disabled").data('value') || 0
        //             totalAllBoq.push($($(this).find('td').eq(0)).find('input').not(":disabled").val());
        //         }else{
        //             totalAllValue = 0
        //             totalAllBoq = []
        //         }
        //     });
        //     $('#allboq').val(totalAllBoq)
        // });
    </script>
@endsection
