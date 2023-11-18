<?php

namespace App\Http\Requests\Auth;

use Illuminate\Auth\Events\Lockout;
use Illuminate\Auth\Events\Registered;
use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\RateLimiter;
use Illuminate\Support\Str;
use Illuminate\Validation\ValidationException;
use Illuminate\Support\Facades\Http;
use App\Models\User;
use App\Models\Role;
use App\Models\UserDetail;

class LoginRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        return [
            'email' => ['required', 'string'],
            'password' => ['required', 'string'],
            'g-recaptcha-response' => 'recaptcha'
        ];
    }

    /**
     * Attempt to authenticate the request's credentials.
     *
     * @return void
     *
     * @throws \Illuminate\Validation\ValidationException
     */
    public function authenticate()
    {
        $this->ensureIsNotRateLimited();

        if (! Auth::attempt($this->only('email', 'password'), $this->boolean('remember'))) {
            //user not exist or wrong email/password
            $data = $this->only('email', 'password');
            //check user on bki
            // $response = Http::withoutVerifying()->post(env('API_BKI', null), [
            //     'email' => $data['email'],
            //     'sandi' => hash('sha512', $data['password']),
            //     'app' => '7ba8e7c470fd011fbdd12868ba277343',
            // ]);

            // if ($response->status() == 200) {
            //     $response = json_decode($response->body());
            //     if ($response->status == 'success') {
            //         //find user existing
            //         $user = User::where('email', $response->email)->first();
            //         if (!$user) {
            //             //create user if not exist
            //             $user = new User();
            //             $user->name = $response->nama;
            //             $user->contact = 0;
            //             $user->email = $response->email;

            //             $role = Role::find(8);
            //             $user->assignRole($role->name);
            //             $user->role_id = 8;

            //             $user->status = "active";
            //             $user->password = bcrypt(time());

            //             $user->save();

            //             $userDetail = new UserDetail();
            //             $userDetail->user_id = $user->id;
            //             // $userDetail->category = "";
            //             $userDetail->expired_date = $response->expired;
            //             $userDetail->nup = $response->nup;
            //             $userDetail->jabatan = $response->jabatan;
            //             $userDetail->kode_departemen = $response->kodeDepartemen;
            //             $userDetail->sign = $response->sign;
            //             $userDetail->photo = $response->photo;
            //             $userDetail->save();

            //             // dd($userDetail);

            //             event(new Registered($user));
            //         }

            //         Auth::login($user);
            //     }
            // }

            RateLimiter::hit($this->throttleKey());

            throw ValidationException::withMessages([
                'email' => trans('auth.failed'),
            ]);
        }

        RateLimiter::clear($this->throttleKey());
    }

    /**
     * Ensure the login request is not rate limited.
     *
     * @return void
     *
     * @throws \Illuminate\Validation\ValidationException
     */
    public function ensureIsNotRateLimited()
    {
        if (! RateLimiter::tooManyAttempts($this->throttleKey(), 5)) {
            return;
        }

        event(new Lockout($this));

        $seconds = RateLimiter::availableIn($this->throttleKey());

        throw ValidationException::withMessages([
            'email' => trans('auth.throttle', [
                'seconds' => $seconds,
                'minutes' => ceil($seconds / 60),
            ]),
        ]);
    }

    /**
     * Get the rate limiting throttle key for the request.
     *
     * @return string
     */
    public function throttleKey()
    {
        return Str::lower($this->input('email')).'|'.$this->ip();
    }
}
