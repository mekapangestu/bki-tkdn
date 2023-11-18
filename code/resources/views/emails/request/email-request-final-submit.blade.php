@component('mail::message')
    # Introduction

    {{ $details['body'] }}

    @component('mail::button', ['url' => ''])
    @endcomponent

    Thanks,<br>
    {{ config('app.name') }}
@endcomponent
