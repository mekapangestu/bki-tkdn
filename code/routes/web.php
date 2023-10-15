<?php

use App\Http\Controllers\Auth\RegisteredUserController;
use App\Http\Controllers\DashboardController;
use App\Http\Controllers\SpkController;
use App\Http\Controllers\BoqController;
use App\Http\Controllers\ClientController;
use App\Http\Controllers\PurchaseOrderController;
use App\Http\Controllers\DeliveryOrderController;
use App\Http\Controllers\JobExecutorController;
use App\Http\Controllers\RoleController;
use App\Http\Controllers\SosController;
use App\Http\Controllers\UserController;
use App\Http\Controllers\UtilController;
use App\Http\Controllers\CoiController;
use App\Http\Controllers\NotificationController;
use App\Http\Controllers\ProjectsController;
use App\Http\Controllers\DocumentReceiptController;
use App\Http\Controllers\RequestController;
use App\Http\Controllers\WhitelistIpController;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

// Route::get('/', function () {
//     return redirect('login');
// });

Route::view('/', 'landing');

Route::group(['middleware' => ['auth']], function () {
    // Route::get('/dashboard', function () {
    //     return view('dashboard');
    // })->name('dashboard');
    Route::get('/dashboard', [DashboardController::class, 'index'])->name('dashboard');
    Route::get('open/{id}', [NotificationController::class, 'markAsRead'])->name('notif.markasread');
    // Route::get('/dashboard/detail-project', [DashboardController::class, 'detailProject'])->name('dashboard.detail-project');
    // Route::get('/dashboard/detail-progress/{id}', [DashboardController::class, 'detailProgress'])->name('dashboard.detail-progress');
    
    // List Permohonan
    Route::resource('requests', RequestController::class);
    Route::get('/requests/verify/{id}', [RequestController::class, 'verifyAdmin'])->name('requests.verify-admin');
    Route::post('/requests/verify/{id}', [RequestController::class, 'verifyAdminSubmit'])->name('requests.verify-admin-submit');
    Route::get('/requests/select-assessor/{id}', [RequestController::class, 'selectAssessor'])->name('requests.select-assessor');
    Route::put('/requests/select-assessor/{id}', [RequestController::class, 'selectAssessorSubmit'])->name('requests.select-assessor-submit');
    Route::get('/requests/upload-documents/{id}', [RequestController::class, 'uploadDocuments'])->name('requests.upload-document');
    Route::post('/requests/upload-documents', [RequestController::class, 'uploadDocumentsSubmit'])->name('requests.upload-document-submit');
    Route::get('/requests/detail/{id}', [RequestController::class, 'detail'])->name('requests.detail');
    Route::get('/requests/assessor-verify/{id}', [RequestController::class, 'assessorVerify'])->name('requests.assessor-verify');
    Route::post('/requests/assessor-verify/{id}', [RequestController::class, 'assessorVerifySubmit'])->name('requests.assessor-verify-submit');

    Route::get('/requests/verify-admin-final/{id}', [RequestController::class, 'verifyAdminFinal'])->name('requests.verify-admin-final');
    Route::post('/requests/verify-admin-final/{id}', [RequestController::class, 'verifyAdminFinalSubmit'])->name('requests.verify-admin-final-submit');
    
    // Proses Verifikasi
    Route::resource('projects', ProjectsController::class);
    Route::get('/projects/verify2/{id}', [ProjectsController::class, 'verify2'])->name('projects.verify2');
    Route::post('/projects/verify2/{id}', [ProjectsController::class, 'verify2Submit'])->name('projects.verify2-submit');
    Route::post('/projects/draf/{id}', [ProjectsController::class, 'drafSubmit'])->name('projects.draf-submit');
    
    
    Route::get('/projects/draf/{id}', [ProjectsController::class, 'draf'])->name('projects.draf');
    Route::get('/projects/tkdn/{id}', [ProjectsController::class, 'tkdn'])->name('projects.tkdn');
    Route::get('/projects/surat-pengantar/{id}', [ProjectsController::class, 'suratPengantar'])->name('projects.surat-pengantar');
    Route::get('/projects/surat-jawaban/{id}', [ProjectsController::class, 'suratJawaban'])->name('projects.surat-jawaban');
    Route::get('/projects/verify-tkdn/{id}', [ProjectsController::class, 'verifyTkdn'])->name('projects.verify-tkdn');
    Route::get('/projects/detail/{id}', [ProjectsController::class, 'detail'])->name('projects.detail');
    Route::get('/projects/view/{id}', [ProjectsController::class, 'view'])->name('projects.view');
    
    Route::post('/projects/verify-tkdn/{id}', [ProjectsController::class, 'verifyTkdnSubmit'])->name('projects.verify-tkdn-submit');
    Route::post('/projects/tkdn/{id}', [ProjectsController::class, 'tkdnSubmit'])->name('projects.tkdn-submit');
    Route::post('/projects/surat-pengantar/{id}', [ProjectsController::class, 'suratPengantarSubmit'])->name('projects.surat-pengantar-submit');
    Route::post('/projects/surat-jawaban/{id}', [ProjectsController::class, 'suratjawabanSubmit'])->name('projects.surat-jawaban-submit');

    Route::get('/projects/pelunasan/{id}', [ProjectsController::class, 'lunas'])->name('projects.lunas');
    Route::post('/projects/pelunasan/{id}', [ProjectsController::class, 'lunasSubmit'])->name('projects.lunas-submit');

    Route::get('/projects/repost/{id}', [DocumentReceiptController::class, 'rePost'])->name('repost');

    Route::resource('user', UserController::class)->middleware('role:superadmin');

    Route::resource('role', RoleController::class)->middleware('role:superadmin');

    Route::resource('client', ClientController::class)->middleware('role:superadmin');

    Route::resource('document-receipt', DocumentReceiptController::class)->middleware('role:superadmin');
    Route::resource('whitelist-ip', WhitelistIpController::class)->middleware('role:superadmin');
});

require __DIR__ . '/auth.php';
