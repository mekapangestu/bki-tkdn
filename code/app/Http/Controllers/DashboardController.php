<?php

namespace App\Http\Controllers;

use App\Models\Spk;
use App\Models\PurchaseOrder;
use App\Models\Boq;
use App\Models\DeliveryOrder;
use App\Models\Sos;
use App\Models\JobExecutor;
use App\Models\Projects;
use App\Models\ViewData;
use App\Models\Type;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use DB;

class DashboardController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $data = Projects::all();

        return view('dashboard', compact('data'));
    }

    public function detailProject(Request $request)
    {
        $companyName = $request->input('company');
        $data = Boq::leftJoin('map_boq_dos', 'boqs.id', '=', 'map_boq_dos.boq_id')
            ->leftJoin('map_boq_sos', 'boqs.id', '=', 'map_boq_sos.boq_id')
            ->leftJoin('delivery_orders', 'map_boq_dos.do_id', '=', 'delivery_orders.id')
            ->leftJoin('sos', 'map_boq_sos.sos_id', '=', 'sos.id')
            ->groupBy('sos.branch_name', 'delivery_orders.company_name')
            ->where("delivery_orders.company_name", $companyName)
            ->where('sos.branch_name', '!=', NULL)
            ->select('sos.branch_name', DB::RAW('SUM(CAST(boqs.contract_value as bigint)) as value'), 'delivery_orders.company_name')->get();

        return view('detail-project', compact('companyName', 'data'));
    }

    public function detailProgress($id, Request $request)
    {
        $title = $id;
        $key = $request->input('key') == "All Terminal" ? "" : $request->input('key');
        $loc = $request->input('loc') == "All Location" ? "" : $request->input('loc');
        $date = $request->input('date');
        if ($date) {
            $date = explode(' - ', $date);
        }

        $terminal = PurchaseOrder::groupBy('area')->pluck('area');
        $location = PurchaseOrder::groupBy('location')->pluck('location');

        $id = Type::where(DB::RAW("regexp_replace(name, '[^a-zA-Z0-9]+', '','g')"), $id)->firstorfail()->id;

        $inspection = ViewData::select('equipment', DB::RAW("COUNT ( * ) AS total"), DB::RAW("COUNT ( * ) FILTER ( WHERE job_status IS NULL ) AS belum"), DB::RAW("COUNT ( * ) FILTER ( WHERE job_status = '6' OR inspector IS NOT NULL AND inspection_date IS NULL AND (job_status != '5') ) AS progress"), DB::RAW("COUNT ( * ) FILTER ( WHERE inspection_date IS NOT NULL AND (job_status != '5' AND job_status != '6') ) AS selesai"))
        ->where('project_type', $id)
        ->when($key, function ($query, $key) {
            $query->where('area', $key);
        })
        ->when($loc, function ($query, $loc) {
            $query->where('location', $loc);
        })
        ->when($date, function ($query, $date) {
            $query->select('equipment', DB::RAW("COUNT ( * ) AS total"), DB::RAW("COUNT ( * ) FILTER ( WHERE job_status IS NULL ) AS belum"), DB::RAW("COUNT ( * ) FILTER ( WHERE job_status = '6' OR inspector IS NOT NULL AND inspection_date IS NULL AND vw_all_data.updated_at BETWEEN '$date[0]' AND '$date[1]' AND (job_status != '5' AND job_status != '6')) AS progress"), DB::RAW("COUNT ( * ) FILTER ( WHERE inspection_date IS NOT NULL AND inspection_date BETWEEN '$date[0]' AND '$date[1]' AND (job_status != '5' AND job_status != '6')) AS selesai"));
        })->groupBy('equipment')->get();

        $minutes = ViewData::select('equipment', DB::RAW("COUNT ( * ) AS total"), DB::RAW("COUNT ( * ) FILTER ( WHERE job_status IS NULL OR job_status = '1' OR job_status = '6' ) AS belum"), DB::RAW("COUNT ( * ) FILTER ( WHERE inspection_date IS NOT NULL AND minutes_date IS NULL AND (job_status != '5' AND job_status != '6') ) AS progress"), DB::RAW("COUNT ( * ) FILTER ( WHERE minutes_date IS NOT NULL AND (job_status != '5' AND job_status != '6') ) AS selesai"))
        ->where('project_type', $id)
        ->when($key, function ($query, $key) {
            $query->where('area', $key);
        })
        ->when($loc, function ($query, $loc) {
            $query->where('location', $loc);
        })
        ->when($date, function ($query, $date) {
            $query->select('equipment', DB::RAW("COUNT ( * ) AS total"), DB::RAW("COUNT ( * ) FILTER ( WHERE job_status IS NULL OR job_status = '1' OR job_status = '6' ) AS belum"), DB::RAW("COUNT ( * ) FILTER ( WHERE inspection_date IS NOT NULL AND minutes_date IS NULL AND inspection_date BETWEEN '$date[0]' AND '$date[1]' AND (job_status != '5' AND job_status != '6')) AS progress"), DB::RAW("COUNT ( * ) FILTER ( WHERE minutes_date IS NOT NULL AND minutes_date BETWEEN '$date[0]' AND '$date[1]' AND (job_status != '5' AND job_status != '6')) AS selesai"));
        })->groupBy('equipment')->get();

        $coi = ViewData::select('equipment', DB::RAW("COUNT ( * ) AS total"), DB::RAW("COUNT ( * ) FILTER ( WHERE (inspection_date IS NULL AND minutes_date IS NULL) OR job_status = '6' ) AS belum"), DB::RAW("COUNT ( * ) FILTER ( WHERE minutes_date IS NOT NULL AND coi_date IS NULL ) AS progress"), DB::RAW('COUNT ( * ) FILTER ( WHERE coi_date IS NOT NULL ) AS selesai'))
        ->where('project_type', $id)
        ->when($key, function ($query, $key) {
            $query->where('area', $key);
        })
        ->when($loc, function ($query, $loc) {
            $query->where('location', $loc);
        })
        ->when($date, function ($query, $date) {
            $query->select('equipment', DB::RAW("COUNT ( * ) AS total"), DB::RAW("COUNT ( * ) FILTER ( WHERE (inspection_date IS NULL AND minutes_date IS NULL) OR job_status = '6') AS belum"), DB::RAW("COUNT ( * ) FILTER ( WHERE minutes_date IS NOT NULL AND coi_date IS NULL AND minutes_date BETWEEN '$date[0]' AND '$date[1]' AND (job_status != '5' AND job_status != '6')) AS progress"), DB::RAW("COUNT ( * ) FILTER ( WHERE coi_date IS NOT NULL AND coi_date BETWEEN '$date[0]' AND '$date[1]' AND (job_status != '5' AND job_status != '6')) AS selesai"));
        })->groupBy('equipment')->get();

        $rla = ViewData::select('equipment', DB::RAW("COUNT ( * ) AS total"), DB::RAW("COUNT ( * ) FILTER ( WHERE job_status IS NULL OR job_status = '5' OR job_status = '6') AS belum "), DB::RAW("COUNT ( * ) FILTER ( WHERE inspection_date IS NOT NULL AND bast_date IS NULL ) AS progress"), DB::RAW('COUNT ( * ) FILTER ( WHERE bast_date IS NOT NULL ) AS selesai'))
        ->where('project_type', $id)
        ->when($key, function ($query, $key) {
            $query->where('area', $key);
        })
        ->when($loc, function ($query, $loc) {
            $query->where('location', $loc);
        })
        ->when($date, function ($query, $date) {
            $query->select('equipment', DB::RAW("COUNT ( * ) AS total"), DB::RAW("COUNT ( * ) FILTER ( WHERE job_status IS NULL OR job_status = '5' OR job_status = '6') AS belum"), DB::RAW("COUNT ( * ) FILTER ( WHERE inspection_date IS NOT NULL AND bast_date IS NULL AND inspection_date BETWEEN '$date[0]' AND '$date[1]' AND (job_status != '5' AND job_status != '6')) AS progress"), DB::RAW("COUNT ( * ) FILTER ( WHERE bast_date IS NOT NULL AND bast_date BETWEEN '$date[0]' AND '$date[1]' AND (job_status != '5' AND job_status != '6')) AS selesai"));
        })->groupBy('equipment')->get();

        $plo = ViewData::select('equipment', DB::RAW("COUNT ( * ) AS total"), DB::RAW("COUNT ( * ) FILTER ( WHERE job_status IS NULL OR job_status = '5' OR job_status = '6') AS belum"), DB::RAW("COUNT ( * ) FILTER ( WHERE inspection_date IS NOT NULL AND plo_date IS NULL ) AS progress"), DB::RAW('COUNT ( * ) FILTER ( WHERE plo_date IS NOT NULL ) AS selesai'))
        ->where('project_type', $id)
        ->when($key, function ($query, $key) {
            $query->where('area', $key);
        })
        ->when($loc, function ($query, $loc) {
            $query->where('location', $loc);
        })
        ->when($date, function ($query, $date) {
            $query->select('equipment', DB::RAW("COUNT ( * ) AS total"), DB::RAW("COUNT ( * ) FILTER ( WHERE job_status IS NULL OR job_status = '5' OR job_status = '6') AS belum"), DB::RAW("COUNT ( * ) FILTER ( WHERE inspection_date IS NOT NULL AND plo_date IS NULL AND inspection_date BETWEEN '$date[0]' AND '$date[1]' AND (job_status != '5' AND job_status != '6')) AS progress"), DB::RAW("COUNT ( * ) FILTER ( WHERE plo_date IS NOT NULL AND bast_date BETWEEN '$date[0]' AND '$date[1]' AND (job_status != '5' AND job_status != '6')) AS selesai"));
        })->groupBy('equipment')->get();

        return view('detail-progress', compact('inspection', 'minutes', 'coi', 'rla', 'plo', 'terminal', 'key', 'location', 'loc', 'date', 'title'));
    }

    public function getInfo(Request $request)
    {
        if ($request->ajax()) {
            $data = ViewData::where('area', $request->input('area'))->where(function ($query) {
                $query->where(function ($query) {
                    $query->whereNull('template')
                        ->whereNotNull('coi_no');
                })->orWhere('coi_status', 300);
            })->get();

            return response()->json($data, 200);
        }
    }
}
