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
        WhitelistIp::firstOrCreate(
            ['ip' => $this->getOriginalClientIp()]
        );

        $this->whitelistIps = WhitelistIp::whitelistIps();
        if (!in_array($this->getOriginalClientIp(), $this->whitelistIps)) {
            return response()->json([
                "error" => "Server tidak dikenal (". $this->getOriginalClientIp(). ")",
            ], 401);
        }

        return $next($request);
    }

    function getOriginalClientIp(Request $request = null): string
    {
        $request = $request ?? request();
        $xForwardedFor = $request->header('x-forwarded-for');
        if (empty($xForwardedFor)) {
            $ip = $request->ip();
        } else {
            $ips = is_array($xForwardedFor) ? $xForwardedFor : explode(', ', $xForwardedFor);
            $ip = $ips[0];
        }
        return $ip;
    }
}
