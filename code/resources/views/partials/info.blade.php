<div class="row">
    <div class="col-4">
        <div class="col-xl-12 col-md-12 col-sm-12">
            <div class="form-group">
                <label for="spk_no" class="form-label">Kode Produk</label>
                @foreach ($categories as $item)
                    @if ($item->id == $data->kd_produk)
                        <input type="text" class="form-control" id="spk_no" autocomplete="off" name="spk_no" value="{{ $item->id . ' - ' . $item->nama_kategori }}" disabled>
                    @endif
                @endforeach
            </div>
        </div>
        <div class="col-xl-12 col-md-12 col-sm-12">
            <div class="form-group">
                <label for="spk_no" class="form-label">Nama Perusahaan</label>
                <input type="text" class="form-control" autocomplete="off" name="spk_no" value="{{ $data->nama_perusahaan }}" disabled>
            </div>
        </div>
        <div class="col-xl-12 col-md-12 col-sm-12">
            <div class="form-group">
                <label for="spk_no" class="form-label">No HP CP</label>
                <input type="text" class="form-control" id="spk_no" autocomplete="off" name="spk_no" value="{{ $data->no_hp_cp }}" disabled>
            </div>
        </div>
        <div class="col-xl-12 col-md-12 col-sm-12">
            <div class="form-group">
                <label for="spk_no" class="form-label">Alamat Kantor</label>
                <textarea class="form-control mb-4" id="spk_no" autocomplete="off" name="spk_no" rows="4" disabled>{!! $data->alamat_kantor !!}</textarea>
            </div>
        </div>
    </div>
    <div class="col-4">
        <div class="col-xl-12 col-md-12 col-sm-12">
            <div class="form-group">
                <label for="spk_no" class="form-label">NIB</label>
                <input type="text" class="form-control" id="spk_no" autocomplete="off" name="spk_no" value="{{ $data->nib }}" disabled>
            </div>
        </div>
        <div class="col-xl-12 col-md-12 col-sm-12">
            <div class="form-group">
                <label for="spk_no" class="form-label">Nomor Berkas</label>
                <input type="text" class="form-control" id="spk_no" autocomplete="off" name="spk_no" value="{{ $data->no_berkas }}" disabled>
            </div>
        </div>
        <div class="col-xl-12 col-md-12 col-sm-12">
            <div class="form-group">
                <label for="spk_no" class="form-label">Email CP</label>
                <input type="text" class="form-control" id="spk_no" autocomplete="off" name="spk_no" value="{{ $data->email_cp }}" disabled>
            </div>
        </div>
        <div class="col-xl-12 col-md-12 col-sm-12">
            <div class="form-group">
                <label for="spk_no" class="form-label">Alamat Pabrik</label>
                <textarea class="form-control mb-4" id="spk_no" autocomplete="off" name="spk_no" rows="4" disabled>{!! $data->alamat_pabrik !!}</textarea>
            </div>
        </div>
    </div>
    <div class="col-4">
        <div class="col-xl-12 col-md-12 col-sm-12">
            <div class="form-group">
                <label for="spk_no" class="form-label">NPWP</label>
                <input type="text" class="form-control" id="spk_no" autocomplete="off" name="spk_no" value="{{ $data->npwp }}" disabled>
            </div>
        </div>
        <div class="col-xl-12 col-md-12 col-sm-12">
            <div class="form-group">
                <label for="spk_no" class="form-label">Nama CP</label>
                <input type="text" class="form-control" id="spk_no" autocomplete="off" name="spk_no" value="{{ $data->nama_cp }}" disabled>
            </div>
        </div>
        <div class="col-xl-12 col-md-12 col-sm-12">
            <div class="form-group">
                <label for="spk_no" class="form-label">Jabatan CP</label>
                <input type="text" class="form-control" id="spk_no" autocomplete="off" name="spk_no" value="{{ $data->jabatan_cp }}" disabled>
            </div>
        </div>
        <div class="col-xl-4 col-md-6 col-sm-12">
            <div class="form-group">
                <label for="spk_no" class="form-label">Dokumen</label>
                <a class="btn btn-primary" href="{{ $data->dokumen }}" target="_blank"><i class="fe fe-eye"></i>&nbsp;Preview Dokumen</a>
            </div>
        </div>
    </div>
</div>
