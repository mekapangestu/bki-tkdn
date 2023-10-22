<?php

namespace App\Http\Controllers;

use App\Models\Spk;
use App\Models\PurchaseOrder;
use App\Models\Boq;
use App\Models\DeliveryOrder;
use App\Models\Sos;
use App\Models\JobExecutor;
use App\Models\Orders;
use App\Models\Projects;
use App\Models\ViewData;
use App\Models\Type;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use DB;
use SebastianBergmann\CodeCoverage\Report\Xml\Project;

class DashboardController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $total = null;
        $acceptstatus = null;
        $accept = null;
        $denied = null;
        $freeze = null;
        $return = null;
        $incomplete = null;
        $stage3 = null;
        $stage4 = null;
        $stage5 = null;
        $stage6 = null;
        $stage7 = null;
        $stage8 = null;
        $stage9 = null;
        $stage10 = null;
        $stage11 = null;
        $lunas = null;
        $terbit = null;

        if (auth()->user()->hasRole('guest')) {
            $total = Projects::with('orders')
                ->when(auth()->user()->hasRole('guest'), function ($q) {
                    return $q->where('user_id', '=', auth()->user()->id);
                })->count();

            $acceptstatus = Projects::where('status_siinas', null)->when(auth()->user()->hasRole('guest'), function ($q) {
                return $q->where('user_id', '=', auth()->user()->id);
            })->count();
            $accept = Projects::where('status_siinas', 1)->when(auth()->user()->hasRole('guest'), function ($q) {
                return $q->where('user_id', '=', auth()->user()->id);
            })->count();
            $denied = Projects::where('status_siinas', 0)->when(auth()->user()->hasRole('guest'), function ($q) {
                return $q->where('user_id', '=', auth()->user()->id);
            })->count();
            $freeze = Projects::where('status_siinas', 3)->when(auth()->user()->hasRole('guest'), function ($q) {
                return $q->where('user_id', '=', auth()->user()->id);
            })->count();
            $return = Projects::where('status_siinas', 2)->when(auth()->user()->hasRole('guest'), function ($q) {
                return $q->where('user_id', '=', auth()->user()->id);
            })->count();
            $incomplete = Projects::where('status_siinas', 4)->when(auth()->user()->hasRole('guest'), function ($q) {
                return $q->where('user_id', '=', auth()->user()->id);
            })->count();
            $stage3 = Projects::where('stage', 3)->when(auth()->user()->hasRole('guest'), function ($q) {
                return $q->where('user_id', '=', auth()->user()->id);
            })->count();
            $stage4 = Projects::where('stage', 4)->when(auth()->user()->hasRole('guest'), function ($q) {
                return $q->where('user_id', '=', auth()->user()->id);
            })->count();
            $stage5 = Projects::where('stage', 5)->when(auth()->user()->hasRole('guest'), function ($q) {
                return $q->where('user_id', '=', auth()->user()->id);
            })->count();
            $stage6 = Projects::where('stage', 6)->when(auth()->user()->hasRole('guest'), function ($q) {
                return $q->where('user_id', '=', auth()->user()->id);
            })->count();
            $stage7 = Projects::where('stage', 7)->when(auth()->user()->hasRole('guest'), function ($q) {
                return $q->where('user_id', '=', auth()->user()->id);
            })->count();
            $stage8 = Projects::where('stage', 8)->when(auth()->user()->hasRole('guest'), function ($q) {
                return $q->where('user_id', '=', auth()->user()->id);
            })->count();
            $stage9 = Projects::where('stage', 9)->when(auth()->user()->hasRole('guest'), function ($q) {
                return $q->where('user_id', '=', auth()->user()->id);
            })->count();
            $stage10 = Projects::where('stage', 10)->when(auth()->user()->hasRole('guest'), function ($q) {
                return $q->where('user_id', '=', auth()->user()->id);
            })->count();
            $stage11 = Projects::where('stage', 11)->when(auth()->user()->hasRole('guest'), function ($q) {
                return $q->where('user_id', '=', auth()->user()->id);
            })->count();
            $terbit = Projects::where('stage', 12)->when(auth()->user()->hasRole('guest'), function ($q) {
                return $q->where('user_id', '=', auth()->user()->id);
            })->count();
            $lunas = Projects::where('status', 1210)->when(auth()->user()->hasRole('guest'), function ($q) {
                return $q->where('user_id', '=', auth()->user()->id);
            })->count();

        } else if (auth()->user()->hasRole('assessor')) {
            $total = Projects::with('orders')
                ->when(auth()->user()->hasRole('assessor'), function ($q) {
                    return $q->whereHas('asesors', function ($q) {
                        return $q->where('asesor', '=', auth()->user()->id);
                    });
                })->count();

            $acceptstatus = Projects::where('status_siinas', null)->when(auth()->user()->hasRole('assessor'), function ($q) {
                return $q->whereHas('asesors', function ($q) {
                    return $q->where('asesor', '=', auth()->user()->id);
                });
            })->count();
            $accept = Projects::where('status_siinas', 1)->when(auth()->user()->hasRole('assessor'), function ($q) {
                return $q->whereHas('asesors', function ($q) {
                    return $q->where('asesor', '=', auth()->user()->id);
                });
            })->count();
            $denied = Projects::where('status_siinas', 0)->when(auth()->user()->hasRole('assessor'), function ($q) {
                return $q->whereHas('asesors', function ($q) {
                    return $q->where('asesor', '=', auth()->user()->id);
                });
            })->count();
            $freeze = Projects::where('status_siinas', 3)->when(auth()->user()->hasRole('assessor'), function ($q) {
                return $q->whereHas('asesors', function ($q) {
                    return $q->where('asesor', '=', auth()->user()->id);
                });
            })->count();
            $return = Projects::where('status_siinas', 3)->when(auth()->user()->hasRole('assessor'), function ($q) {
                return $q->whereHas('asesors', function ($q) {
                    return $q->where('asesor', '=', auth()->user()->id);
                });
            })->count();
            $incomplete = Projects::where('status_siinas', 4)->when(auth()->user()->hasRole('assessor'), function ($q) {
                return $q->whereHas('asesors', function ($q) {
                    return $q->where('asesor', '=', auth()->user()->id);
                });
            })->count();
            $stage3 = Projects::where('stage', 3)->when(auth()->user()->hasRole('assessor'), function ($q) {
                return $q->whereHas('asesors', function ($q) {
                    return $q->where('asesor', '=', auth()->user()->id);
                });
            })->count();
            $stage4 = Projects::where('stage', 4)->when(auth()->user()->hasRole('assessor'), function ($q) {
                return $q->whereHas('asesors', function ($q) {
                    return $q->where('asesor', '=', auth()->user()->id);
                });
            })->count();
            $stage5 = Projects::where('stage', 5)->when(auth()->user()->hasRole('assessor'), function ($q) {
                return $q->whereHas('asesors', function ($q) {
                    return $q->where('asesor', '=', auth()->user()->id);
                });
            })->count();
            $stage6 = Projects::where('stage', 6)->when(auth()->user()->hasRole('assessor'), function ($q) {
                return $q->whereHas('asesors', function ($q) {
                    return $q->where('asesor', '=', auth()->user()->id);
                });
            })->count();
            $stage7 = Projects::where('stage', 7)->when(auth()->user()->hasRole('assessor'), function ($q) {
                return $q->whereHas('asesors', function ($q) {
                    return $q->where('asesor', '=', auth()->user()->id);
                });
            })->count();
            $stage8 = Projects::where('stage', 8)->when(auth()->user()->hasRole('assessor'), function ($q) {
                return $q->whereHas('asesors', function ($q) {
                    return $q->where('asesor', '=', auth()->user()->id);
                });
            })->count();
            $stage9 = Projects::where('stage', 9)->when(auth()->user()->hasRole('assessor'), function ($q) {
                return $q->whereHas('asesors', function ($q) {
                    return $q->where('asesor', '=', auth()->user()->id);
                });
            })->count();
            $stage10 = Projects::where('stage', 10)->when(auth()->user()->hasRole('assessor'), function ($q) {
                return $q->whereHas('asesors', function ($q) {
                    return $q->where('asesor', '=', auth()->user()->id);
                });
            })->count();
            $stage11 = Projects::where('stage', 11)->when(auth()->user()->hasRole('assessor'), function ($q) {
                return $q->whereHas('asesors', function ($q) {
                    return $q->where('asesor', '=', auth()->user()->id);
                });
            })->count();
            $terbit = Projects::where('stage', 12)->when(auth()->user()->hasRole('assessor'), function ($q) {
                return $q->whereHas('asesors', function ($q) {
                    return $q->where('asesor', '=', auth()->user()->id);
                });
            })->count();
            $lunas = Projects::where('status', 1210)->when(auth()->user()->hasRole('assessor'), function ($q) {
                return $q->whereHas('asesors', function ($q) {
                    return $q->where('asesor', '=', auth()->user()->id);
                });
            })->count();
        } else if (auth()->user()->hasRole('qc')) {
            $total = Projects::with('orders')
                ->when(auth()->user()->hasRole('qc'), function ($q) {
                    return $q->whereHas('qc', function ($q) {
                        return $q->where('qc', '=', auth()->user()->id);
                    });
                })->count();

            $acceptstatus = Projects::where('status_siinas', null)->when(auth()->user()->hasRole('qc'), function ($q) {
                return $q->whereHas('qc', function ($q) {
                    return $q->where('qc', '=', auth()->user()->id);
                });
            })->count();
            $accept = Projects::where('status_siinas', 1)->when(auth()->user()->hasRole('qc'), function ($q) {
                return $q->whereHas('qc', function ($q) {
                    return $q->where('qc', '=', auth()->user()->id);
                });
            })->count();
            $denied = Projects::where('status_siinas', 0)->when(auth()->user()->hasRole('qc'), function ($q) {
                return $q->whereHas('qc', function ($q) {
                    return $q->where('qc', '=', auth()->user()->id);
                });
            })->count();
            $freeze = Projects::where('status_siinas', 3)->when(auth()->user()->hasRole('qc'), function ($q) {
                return $q->whereHas('qc', function ($q) {
                    return $q->where('qc', '=', auth()->user()->id);
                });
            })->count();
            $return = Projects::where('status_siinas', 3)->when(auth()->user()->hasRole('qc'), function ($q) {
                return $q->whereHas('qc', function ($q) {
                    return $q->where('qc', '=', auth()->user()->id);
                });
            })->count();
            $incomplete = Projects::where('status_siinas', 4)->when(auth()->user()->hasRole('qc'), function ($q) {
                return $q->whereHas('qc', function ($q) {
                    return $q->where('qc', '=', auth()->user()->id);
                });
            })->count();
            $stage3 = Projects::where('stage', 3)->when(auth()->user()->hasRole('qc'), function ($q) {
                return $q->whereHas('qc', function ($q) {
                    return $q->where('qc', '=', auth()->user()->id);
                });
            })->count();
            $stage4 = Projects::where('stage', 4)->when(auth()->user()->hasRole('qc'), function ($q) {
                return $q->whereHas('qc', function ($q) {
                    return $q->where('qc', '=', auth()->user()->id);
                });
            })->count();
            $stage5 = Projects::where('stage', 5)->when(auth()->user()->hasRole('qc'), function ($q) {
                return $q->whereHas('qc', function ($q) {
                    return $q->where('qc', '=', auth()->user()->id);
                });
            })->count();
            $stage6 = Projects::where('stage', 6)->when(auth()->user()->hasRole('qc'), function ($q) {
                return $q->whereHas('qc', function ($q) {
                    return $q->where('qc', '=', auth()->user()->id);
                });
            })->count();
            $stage7 = Projects::where('stage', 7)->when(auth()->user()->hasRole('qc'), function ($q) {
                return $q->whereHas('qc', function ($q) {
                    return $q->where('qc', '=', auth()->user()->id);
                });
            })->count();
            $stage8 = Projects::where('stage', 8)->when(auth()->user()->hasRole('qc'), function ($q) {
                return $q->whereHas('qc', function ($q) {
                    return $q->where('qc', '=', auth()->user()->id);
                });
            })->count();
            $stage9 = Projects::where('stage', 9)->when(auth()->user()->hasRole('qc'), function ($q) {
                return $q->whereHas('qc', function ($q) {
                    return $q->where('qc', '=', auth()->user()->id);
                });
            })->count();
            $stage10 = Projects::where('stage', 10)->when(auth()->user()->hasRole('qc'), function ($q) {
                return $q->whereHas('qc', function ($q) {
                    return $q->where('qc', '=', auth()->user()->id);
                });
            })->count();
            $stage11 = Projects::where('stage', 11)->when(auth()->user()->hasRole('qc'), function ($q) {
                return $q->whereHas('qc', function ($q) {
                    return $q->where('qc', '=', auth()->user()->id);
                });
            })->count();
            $terbit = Projects::where('stage', 12)->when(auth()->user()->hasRole('qc'), function ($q) {
                return $q->whereHas('qc', function ($q) {
                    return $q->where('qc', '=', auth()->user()->id);
                });
            })->count();
            $lunas = Projects::where('status', 1210)->when(auth()->user()->hasRole('qc'), function ($q) {
                return $q->whereHas('qc', function ($q) {
                    return $q->where('qc', '=', auth()->user()->id);
                });
            })->count();
        } else {
            $total = Projects::all()->count();
            $acceptstatus = Projects::where('status_siinas', null)->count();
            $accept = Projects::where('status_siinas', 1)->count();
            $denied = Projects::where('status_siinas', 0)->count();
            $freeze = Projects::where('status_siinas', 3)->count();
            $return = Projects::where('status_siinas', 2)->count();
            $incomplete = Projects::where('status_siinas', 4)->count();
            $stage3 = Projects::where('stage', 3)->count();
            $stage4 = Projects::where('stage', 4)->count();
            $stage5 = Projects::where('stage', 5)->count();
            $stage6 = Projects::where('stage', 6)->count();
            $stage7 = Projects::where('stage', 7)->count();
            $stage8 = Projects::where('stage', 8)->count();
            $stage9 = Projects::where('stage', 9)->count();
            $stage10 = Projects::where('stage', 10)->count();
            $stage11 = Projects::where('stage', 11)->count();
            $terbit = Projects::where('stage', 12)->count();
            $lunas = Projects::where('status', 1210)->count();
        }

        $users = User::where('role_id', 5)->count();

        $title = "Dashboard";
        return view('dashboard', compact('total', 'users', 'freeze', 'accept', 'denied', 'acceptstatus', 'incomplete', 'return', 'title', 'stage3', 'stage4', 'stage5', 'stage6', 'stage7', 'stage8', 'stage9', 'stage10', 'stage11', 'terbit', 'lunas'));
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
