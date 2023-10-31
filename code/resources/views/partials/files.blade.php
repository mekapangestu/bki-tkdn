<div class="row">
    <div class="col-12">
        @if (count($project->project_files))
            <div class="card custom-card">
                <div class="card-header border-bottom">
                    <h3 class="card-title">Pemohon Document</h3>
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
                                @foreach ($project->project_files as $file)
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
        @endif
        @forelse ($project->productType ?? [] as $item)
            <div class="card custom-card">
                <div class="card-header border-bottom">
                    <h3 class="card-title">{{ Str::headline($item->tipe_produk) }} {{ Str::headline($item->spesifikasi) }} Document</h3>
                </div>
                <div class="card-body">
                    <div class="">
                        <table id="example2" class="table table-bordered text-nowrap border-bottom text-center">
                            <thead>
                                <tr>
                                    <th class="border-bottom-0" style="width: 25px">No</th>
                                    <th class="border-bottom-0">Nama Dokumen</th>
                                    <th class="border-bottom-0">Nomor Dokumen</th>
                                    <th class="border-bottom-0">Berlaku Sejak</th>
                                    <th class="border-bottom-0">Berlaku Sampai</th>
                                    <th class="border-bottom-0">Version</th>
                                    <th class="border-bottom-0">Created At</th>
                                    <th class="border-bottom-0">Updated At</th>
                                    <th class="border-bottom-0" style="width: 50px">Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                @foreach ($project->files as $file)
                                    @if ($item->id == $file->id_produk)
                                        <tr>
                                            <td>{{ $loop->iteration }}</td>
                                            <td>{{ $file->label }}</td>
                                            <td>{{ $file->number }}</td>
                                            <td>{{ $file->valid_since }}</td>
                                            <td>{{ $file->valid_until }}</td>
                                            <td>{{ $file->version }}</td>
                                            <td>{{ $file->created_at }}</td>
                                            <td>{{ $file->updated_at }}</td>
                                            <td>
                                                <a href="{{ asset('storage/' . $file->path) }}" target="_blank" class="btn text-primary btn-sm" data-bs-toggle="tooltip" data-bs-original-title="View"><span class="fe fe-eye fs-14"></span></a>
                                                {{-- <a href="{{ route('delete.file', [$data->id, $file->label, $file->id]) }}" class="btn text-danger btn-sm" data-bs-toggle="tooltip" data-bs-original-title="Delete"><span class="fe fe-trash fs-14"></span></a> --}}
                                            </td>
                                        </tr>
                                    @endif
                                @endforeach
                            </tbody>
                        </table>
                        <div class="card custom-card">
                            <div class="card-header border-bottom">
                                <h3 class="card-title">Foto Produk</h3>
                            </div>
                            <div class="card-body">
                                <ul class="lightgallery list-unstyled row">
                                    @foreach ($project->foto as $file)
                                        @if ($item->id == $file->id_produk)
                                            <li class="col-xs-6 col-sm-4 col-md-4 col-xl-3 mb-5 border-bottom-0" data-responsive="{{ asset('storage/' . $file->path) }}" data-src="{{ asset('storage/' . $file->path) }}" data-sub-html="<h4>{{Str::headline($item->produk)}}</h4>">
                                                @php
                                                    $allowedMimeTypes = ['jpg', 'jpeg', 'gif', 'png', 'bmp', 'svg', 'svgz', 'cgm', 'djv', 'djvu', 'ico', 'ief','jpe', 'pbm', 'pgm', 'pnm', 'ppm', 'ras', 'rgb', 'tif', 'tiff', 'wbmp', 'xbm', 'xpm', 'xwd'];
                                                    $explodeImage = explode('.', asset('storage/' . $file->path));
                                                    $extension = end($explodeImage);
                                                @endphp
                                                @if (in_array($extension, $allowedMimeTypes))
                                                    <a href="javascript:void(0)">
                                                        <img class="img-responsive br-5" src="{{ asset('storage/' . $file->path) }}">
                                                    </a>
                                                    @else
                                                    <a onclick="window.open('{{asset('storage/' . $file->path)}}', '_blank');" href="{{asset('storage/' . $file->path)}}">View File</a>
                                                @endif
                                            </li>
                                        @endif
                                    @endforeach
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        @empty
        @endforelse
    </div>
</div>