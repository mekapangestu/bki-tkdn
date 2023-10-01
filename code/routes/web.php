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
    
    Route::resource('projects', ProjectsController::class);
    Route::get('/projects/verify-admin/{id}', [ProjectsController::class, 'verifyAdmin'])->name('projects.verify-admin');
    Route::get('/projects/verify-admin2/{id}', [ProjectsController::class, 'verifyAdmin2'])->name('projects.verify-admin2');
    Route::get('/projects/verify/{id}', [ProjectsController::class, 'verify'])->name('projects.verify');
    Route::get('/projects/verify2/{id}', [ProjectsController::class, 'verify2'])->name('projects.verify2');
    Route::post('/projects/verify-admin/{id}', [ProjectsController::class, 'verifyAdminSubmit'])->name('projects.verify-admin-submit');
    Route::post('/projects/verify/{id}', [ProjectsController::class, 'verifySubmit'])->name('projects.verify-submit');
    Route::post('/projects/verify2/{id}', [ProjectsController::class, 'verify2Submit'])->name('projects.verify2-submit');
    Route::post('/projects/draf/{id}', [ProjectsController::class, 'drafSubmit'])->name('projects.draf-submit');
    
    Route::post('/projects/verify-admin2/{id}', [ProjectsController::class, 'submit'])->name('projects.submit');
    
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

    Route::get('/projects/repost/{id}', [DocumentReceiptController::class, 'rePost'])->name('repost');

    Route::resource('user', UserController::class)->middleware('role:superadmin');

    Route::resource('role', RoleController::class)->middleware('role:superadmin');

    Route::resource('client', ClientController::class)->middleware('role:superadmin');

    Route::resource('document-receipt', DocumentReceiptController::class)->middleware('role:superadmin');
});

require __DIR__ . '/auth.php';
