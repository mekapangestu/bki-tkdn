<div class="row">
    <div class="col-12">
        <div class="card">
            <div class="card-header">
                <h3 class="card-title">Data Permohonan</h3>
            </div>
            <div class="card-body">
                <div class="row">
                    <div class="col-xl-4 col-md-6 col-sm-12">
                        <div class="form-group">
                            <label for="spk_no" class="form-label">NIB</label>
                            <input type="text" class="form-control" id="spk_no" autocomplete="off" name="spk_no" value="{!! $data->nib !!}" disabled>
                        </div>
                    </div>

                    <div class="col-xl-4 col-md-6 col-sm-12">
                        <div class="form-group">
                            <label for="spk_no" class="form-label">NPWP</label>
                            <input type="text" class="form-control" id="spk_no" autocomplete="off" name="spk_no" value="{!! $data->npwp !!}" disabled>
                        </div>
                    </div>
                    <div class="col-xl-4 col-md-6 col-sm-12">
                        <div class="form-group">
                            <label for="spk_no" class="form-label">Nama Perusahaan</label>
                            <input type="text" class="form-control" autocomplete="off" name="spk_no" value="{!! $data->nama_perusahaan !!}" disabled>
                        </div>
                    </div>
                    <div class="col-xl-4 col-md-6 col-sm-12">
                        <div class="form-group">
                            <label for="spk_no" class="form-label">Kode Produk</label>
                            <input type="text" class="form-control" id="spk_no" autocomplete="off" name="spk_no" value="{!! $data->kd_produk !!}" disabled>
                        </div>
                    </div>
                    <div class="col-xl-4 col-md-6 col-sm-12">
                        <div class="form-group">
                            <label for="spk_no" class="form-label">Nomer Berkas</label>
                            <input type="text" class="form-control" id="spk_no" autocomplete="off" name="spk_no" value="{!! $data->no_berkas !!}" disabled>
                        </div>
                    </div>
                    <div class="col-xl-4 col-md-6 col-sm-12">
                        <div class="form-group">
                            <label for="spk_no" class="form-label">Nama CP</label>
                            <input type="text" class="form-control" id="spk_no" autocomplete="off" name="spk_no" value="{!! $data->nama_cp !!}" disabled>
                        </div>
                    </div>

                    <div class="col-xl-4 col-md-6 col-sm-12">
                        <div class="form-group">
                            <label for="spk_no" class="form-label">No HP CP</label>
                            <input type="text" class="form-control" id="spk_no" autocomplete="off" name="spk_no" value="{!! $data->no_hp_cp !!}" disabled>
                        </div>
                    </div>

                    <div class="col-xl-4 col-md-6 col-sm-12">
                        <div class="form-group">
                            <label for="spk_no" class="form-label">Email CP</label>
                            <input type="text" class="form-control" id="spk_no" autocomplete="off" name="spk_no" value="{!! $data->email_cp !!}" disabled>
                        </div>
                    </div>

                    <div class="col-xl-4 col-md-6 col-sm-12">
                        <div class="form-group">
                            <label for="spk_no" class="form-label">Jabatan CP</label>
                            <input type="text" class="form-control" id="spk_no" autocomplete="off" name="spk_no" value="{!! $data->jabatan_cp !!}" disabled>
                        </div>
                    </div>
                    <div class="col-xl-4 col-md-6 col-sm-12">
                        <div class="form-group">
                            <label for="spk_no" class="form-label">Alamat Kantor</label>
                            <input type="text" class="form-control" id="spk_no" autocomplete="off" name="spk_no" value="{!! $data->alamat_kantor !!}" disabled>
                        </div>
                    </div>
                    <div class="col-xl-4 col-md-6 col-sm-12">
                        <div class="form-group">
                            <label for="spk_no" class="form-label">Alamat Pabrik</label>
                            <input type="text" class="form-control" id="spk_no" autocomplete="off" name="spk_no" value="{!! $data->alamat_pabrik !!}" disabled>
                        </div>
                    </div>
                    <div class="col-xl-4 col-md-6 col-sm-12">
                        <div class="form-group">
                            <label for="spk_no" class="form-label">Dokumen</label>
                            <a class="btn btn-primary" href="{{ $data->dokumen }}" target="_blank"><i class="fe fe-eye"></i>&nbsp;Preview Dokumen</a>
                        </div>
                    </div>
                </div>
                <nav>
                    <div class="nav nav-tabs" id="nav-tab" role="tablist" style="padding: 25px;">
                        <button class="nav-link active" data-bs-toggle="tab" data-bs-target="#collapseProduk" type="button" role="tab" aria-controls="collapseProduk" aria-selected="true">Produk</button>
                        <button class="nav-link" data-bs-toggle="tab" data-bs-target="#collapseMesin" type="button" role="tab" aria-controls="collapseMesin" aria-selected="false">Mesin</button>
                        <button class="nav-link" data-bs-toggle="tab" data-bs-target="#collapseNaker" type="button" role="tab" aria-controls="collapseNaker" aria-selected="false">Tenaga Kerja</button>
                        <button class="nav-link" data-bs-toggle="tab" data-bs-target="#collapseProduksi" type="button" role="tab" aria-controls="collapseProduksi" aria-selected="false">Produksi</button>
                        <button class="nav-link" data-bs-toggle="tab" data-bs-target="#collapseKapasitas" type="button" role="tab" aria-controls="collapseKapasitas" aria-selected="false">Kapasitas</button>
                        <button class="nav-link" data-bs-toggle="tab" data-bs-target="#collapseBahanBaku" type="button" role="tab" aria-controls="collapseBahanBaku" aria-selected="false">Bahan Baku</button>
                        <button class="nav-link" data-bs-toggle="tab" data-bs-target="#collapseBahanPenolong" type="button" role="tab" aria-controls="collapseBahanPenolong" aria-selected="false">Bahan Penolong</button>
                        <button class="nav-link" data-bs-toggle="tab" data-bs-target="#collapseTenaga" type="button" role="tab" aria-controls="collapseTenaga" aria-selected="false">Petugas Verifikasi</button>
                    </div>
                </nav>
                <div class="tab-content" id="nav-tabContent">
                    <div class="tab-pane fade show active" id="collapseProduk" role="tabpanel" aria-labelledby="collapseProduk-tab">
                        <table class="table table-hover" id="collapseProduk">
                            @forelse ($data->produk as $item)
                                <tr>
                                    <th colspan="3" style="text-align: left; vertical-align: middle; font-size: 20px; background-color: #e25b31; color: #fff">Produk {{ $loop->iteration }} - {!! $item->produk !!}</th>
                                </tr>
                                <tr>
                                    <td width="30%">ID Produk</td>
                                    <td width="1%">:</td>
                                    <td>{{ $item->id_produk }}</td>
                                </tr>
                                <tr>
                                    <td width="30%">Nama Produk</td>
                                    <td width="1%">:</td>
                                    <td>{!! $item->produk !!}</td>
                                </tr>
                            @empty
                                <tr>
                                    <td colspan="3">Tidak ada produk.</td>
                                </tr>
                            @endforelse
                        </table>
                    </div>
                    <div class="tab-pane fade" id="collapseMesin" role="tabpanel" aria-labelledby="collapseMesin-tab">
                        <table class="table table-hover" id="collapseMesin">
                            @forelse ($data->mesin as $item)
                                <tr>
                                    <th colspan="3" style="text-align: left; vertical-align: middle; font-size: 20px; background-color: #e25b31; color: #fff">Mesin {{ $loop->iteration }} - {!! $item->merk_tipe ?? 'Tidak Ada Merk' !!}</th>
                                </tr>
                                @foreach ($item as $key => $item)
                                    <tr>
                                        <td width="30%">{!! Str::headline($key) !!}</td>
                                        <td width="1">:</td>
                                        <td>{!! $item !!}</td>
                                    </tr>
                                @endforeach
                            @empty
                                <tr>
                                    <td colspan="3">Tidak ada produk.</td>
                                </tr>
                            @endforelse
                        </table>
                    </div>
                    <div class="tab-pane fade" id="collapseNaker" role="tabpanel" aria-labelledby="collapseNaker-tab">
                        <table class="table table-hover" id="collapseNaker">
                            @forelse ($data->naker as $item)
                                @foreach ($item as $key => $item)
                                    <tr>
                                        <td width="30%">{!! Str::headline($key) !!}</td>
                                        <td width="1">:</td>
                                        <td>{!! $item !!}</td>
                                    </tr>
                                @endforeach
                            @empty
                                <tr>
                                    <td colspan="3">Tidak ada produk.</td>
                                </tr>
                            @endforelse
                        </table>
                    </div>
                    <div class="tab-pane fade" id="collapseProduksi" role="tabpanel" aria-labelledby="collapseProduksi-tab">
                        <table class="table table-hover" id="collapseProduksi">
                            @forelse ($data->produksi as $item)
                                <tr>
                                    <th colspan="3" style="text-align: left; vertical-align: middle; font-size: 20px; background-color: #e25b31; color: #fff">Produk {{ $loop->iteration }} - {!! $item->produk ?? 'Tidak Ada Merk' !!}</th>
                                </tr>
                                @foreach ($item as $key => $item)
                                    <tr>
                                        <td width="30%">{!! Str::headline($key) !!}</td>
                                        <td width="1">:</td>
                                        <td>{!! $item !!}</td>
                                    </tr>
                                @endforeach
                            @empty
                                <tr>
                                    <td colspan="3">Tidak ada produk.</td>
                                </tr>
                            @endforelse
                        </table>
                    </div>
                    <div class="tab-pane fade" id="collapseKapasitas" role="tabpanel" aria-labelledby="collapseKapasitas-tab">
                        <table class="table table-hover" id="collapseKapasitas">
                            @forelse ($data->kapasitas as $item)
                                <tr>
                                    <th colspan="3" style="text-align: left; vertical-align: middle; font-size: 20px; background-color: #e25b31; color: #fff">Produk {{ $loop->iteration }} - {!! $item->produk ?? 'Tidak Ada Merk' !!}</th>
                                </tr>
                                @foreach ($item as $key => $item)
                                    <tr>
                                        <td width="30%">{!! Str::headline($key) !!}</td>
                                        <td width="1">:</td>
                                        <td>{!! $item !!}</td>
                                    </tr>
                                @endforeach
                            @empty
                                <tr>
                                    <td colspan="3">Tidak ada produk.</td>
                                </tr>
                            @endforelse
                        </table>
                    </div>
                    <div class="tab-pane fade" id="collapseBahanBaku" role="tabpanel" aria-labelledby="collapseBahanBaku-tab">
                        <table class="table table-hover" id="collapseBahanBaku">
                            @forelse ($data->bahan_baku as $item)
                                @foreach ($item as $key => $item)
                                    <tr>
                                        <td width="30%">{!! Str::headline($key) !!}</td>
                                        <td width="1">:</td>
                                        <td>{!! $item !!}</td>
                                    </tr>
                                @endforeach
                            @empty
                                <tr>
                                    <td colspan="3">Tidak ada produk.</td>
                                </tr>
                            @endforelse
                        </table>
                    </div>
                    <div class="tab-pane fade" id="collapseBahanPenolong" role="tabpanel" aria-labelledby="collapseBahanPenolong-tab">
                        <table class="table table-hover" id="collapseBahanPenolong">
                            @forelse ($data->bahan_penolong as $item)
                                @foreach ($item as $key => $item)
                                    <tr>
                                        <td width="30%">{!! Str::headline($key) !!}</td>
                                        <td width="1">:</td>
                                        <td>{!! $item !!}</td>
                                    </tr>
                                @endforeach
                            @empty
                                <tr>
                                    <td colspan="3">Tidak ada produk.</td>
                                </tr>
                            @endforelse
                        </table>
                    </div>
                    <div class="tab-pane fade" id="collapseTenaga" role="tabpanel" aria-labelledby="collapseTenaga-tab">
                        <div class="row" style="padding-top: 30px">
                            <div class="col-6">
                                <h4><strong>Assessor List</strong></h4>
                                <table class="table table-hover" id="collapseTenaga">
                                    @forelse($assessor as $as)
                                        <tr>
                                            <td rowspan="4"><img src="{{ asset('/assets/images/149071.png') }}" alt="" style="max-height: 100px;"></td>
                                        </tr>
                                        <tr>
                                            <td>Nama</td>
                                            <td>:</td>
                                            <td><strong>{{ $as->name }}</strong></td>
                                        </tr>
                                        <tr>
                                            <td>Kontak</td>
                                            <td>:</td>
                                            <td><strong>{{ $as->contact }}</strong></td>
                                        </tr>
                                        <tr>
                                            <td>Email</td>
                                            <td>:</td>
                                            <td><strong>{{ $as->email }}</strong></td>
                                        </tr>
                                    @empty
                                        <tr>
                                            <td colspan="3">Tidak ada produk.</td>
                                        </tr>
                                    @endforelse
                                </table>
                            </div>
                            <div class="col-6">
                                <table class="table table-hover" id="collapseTenaga">
                                    <h5><strong>QC Officer List</strong></h5>
                                    @forelse($qc as $q)
                                        <tr>
                                            <td rowspan="4"><img src="{{ asset('/assets/images/149071.png') }}" alt="" style="max-height: 100px;"></td>
                                        </tr>
                                        <tr>
                                            <td>Nama</td>
                                            <td>:</td>
                                            <td><strong>{{ $q->name }}</strong></td>
                                        </tr>
                                        <tr>
                                            <td>Kontak</td>
                                            <td>:</td>
                                            <td><strong>{{ $q->contact }}</strong></td>
                                        </tr>
                                        <tr>
                                            <td>Email</td>
                                            <td>:</td>
                                            <td><strong>{{ $q->email }}</strong></td>
                                        </tr>
                                    @empty
                                        <tr>
                                            <td colspan="3">Tidak ada produk.</td>
                                        </tr>
                                    @endforelse
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- CONTAINER END -->
