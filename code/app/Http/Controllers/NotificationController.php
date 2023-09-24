<?php

namespace App\Http\Controllers;

class NotificationController extends Controller
{
    public function markAsRead($id){
        $notification = auth()->user()->notifications()->where('id', $id)->first();
        $notification?->markAsRead();
        if (isset($notification->data['actionURL'])) {
            return redirect($notification->data['actionURL']);
        }else{
            return redirect()->back();
        }
    }
}
