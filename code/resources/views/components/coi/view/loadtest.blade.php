<table style="width:100%;" cellspacing="0" cellpadding="4" border="1">
    <thead>
        <tr>
            <th>No</th>
            <th><p>Test Beban<span class="translate">Test Load</span></p>(Ton)</th>
            <th><p>Beban Kerja Aman<span class="translate">Safe Working Load</span></p>(Ton)</th>
            <th><p>Defleksi Aktual</p>(mm)</th>
            <th><p>Defleksi Max.</p>(mm)</th>
            <th><p>Hasil<span class="translate">Result</span></p></th>
            <th><p>Catatan<span class="translate">Remark</span></p></th>
        </tr>
        <tr>
            <th colspan="7" style="text-align:left">A. MAIN HOIST (1 Partline)</th>
        </tr>
    </thead>
    <tbody>
        @foreach($technical['test_load'] as $val)
        <tr>
            <td>{{$loop->iteration}}</td>
            <td>{{$technical['test_load'][$loop->index]}}</td>
            <td>{{$technical['safe_working_load'][$loop->index]}}</td>
            <td>{{$technical['deflection_actual'][$loop->index]}}</td>
            <td>{{$technical['deflection_max'][$loop->index]}}</td>
            <td>{{$technical['result'][$loop->index]}}</td>
            <td>{{$technical['remark'][$loop->index]}}</td>
        </tr>
        @endforeach
    </tbody>
</table>