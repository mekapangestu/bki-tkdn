<div class="col-3">
    {{-- <div class="form-group">
        <label for="inspection_date" class="form-label">SO/PO No</label>
        <select class="form-control form-select select2" name="po_no[]">
            @foreach ($list as $item)
                @if (isset($po) && $item->po_no_ == $po->po_no)
                    <option value="{{ $item->po_no }}" selected>{{ $item->po_no }}</option>
                @else
                    <option value="{{ $item->po_no }}">{{ $item->po_no }}</option>
                @endif
            @endforeach
        </select>
    </div> --}}
    <div class="form-group">
        <label for="type" class="form-label">Type</label>
        <select class="form-control form-select select2" name="project_type[]">
            @foreach ($type as $val)
                <option value="{{ $val->id }}">{{ $val->name }}</option>
            @endforeach
        </select>
    </div>
    <div class="form-group">
        <label for="inspection_date" class="form-label">Size</label>
        <input type="text" class="form-control" name="size[]" placeholder="Enter Size">
    </div>
</div>
<div class="col-3">
    <div class="form-group">
        <label for="tools" class="form-label">Equipment</label>
        <input type="text" class="form-control" id="tools" name="equipment[]" placeholder="Enter Equipment">
    </div>

    <div class="form-group">
        <label for="inspection_date" class="form-label">Dimension</label>
        <input type="text" class="form-control" name="dimension[]" placeholder="Enter Dimension">
    </div>

    {{-- <div class="form-group">
        <label for="" class="form-label">Upload Document</label>
        <input class="form-control" type="file" id="formFileMultiple" autocomplete="off" name="boq" accept="application/msword, application/vnd.ms-excel, text/plain, application/pdf">
    </div> --}}
</div>
<div class="col-3">
    <div class="form-group">
        <label for="tag_number" class="form-label">Tag No</label>
        <input type="text" class="form-control" id="tag_number" name="tag_number[]" placeholder="Enter Tag No">
    </div>
    <div class="form-group">
        <label for="inspection_date" class="form-label">Capacity</label>
        <input type="text" class="form-control" name="capacity[]" placeholder="Enter Capacity">
    </div>
</div>
<div class="col-3">
    <div class="form-group">
        <label for="inspector" class="form-label">Value</label>
        <input type="text" class="form-control currency" id="contract_value" name="contract_value[]" placeholder="Enter Value">
    </div>
    <div class="form-group">
        <label for="note" class="form-label">Note</label>
        <textarea class="form-control" id="note" name="note[]"></textarea>
    </div>
</div>