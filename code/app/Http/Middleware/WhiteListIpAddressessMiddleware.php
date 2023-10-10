<?php

namespace App\Http\Middleware;

use App\Models\WhitelistIp;
use Closure;
use Illuminate\Http\Request;

class WhiteListIpAddressessMiddleware
{
    public $whitelistIps = [];

    /**
     * Handle an incoming request.
     *
     * @param Request $request
     * @param Closure $next
     * @return mixed
     */
    public function handle(Request $request, Closure $next)
    {
        $this->whitelistIps = WhitelistIp::findWhitelist();
        WhitelistIp::updateOrCreate(
            ['ip' => $request->getClientIp()],
            ['ip' => $request->getClientIp()]
        );
        if (!in_array($request->getClientIp(), $this->whitelistIps)) {
            return response()->json([
                "error" => "Server tidak dikenal (". $request->getClientIp(). ")",
            ], 401);
        }

        return $next($request);
    }
}
