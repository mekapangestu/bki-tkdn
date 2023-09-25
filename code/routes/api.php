<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Api;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::post('/auth/login', [Api\AuthController::class, 'login']);

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});

Route::post('orders', [Api\OrdersController::class, 'store']);
Route::post('permohonan', [Api\OrdersController::class, 'permohonan']);
// Route::post('tahap3', [Api\OrdersController::class, 'tahap3']);
// Route::post('tahap5', [Api\OrdersController::class, 'tahap5']);
// Route::post('tahap7', [Api\OrdersController::class, 'tahap7']);
// Route::post('tahap8', [Api\OrdersController::class, 'tahap8']);
// Route::post('tahap9', [Api\OrdersController::class, 'tahap9']);
// Route::post('tahap11', [Api\OrdersController::class, 'tahap11']);
// Route::post('tahap12', [Api\OrdersController::class, 'tahap12']);