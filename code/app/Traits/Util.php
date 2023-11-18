<?php

namespace App\Traits;

use App\Models\Upload;
use DateTime;
use DateTimeZone;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\File;

trait Util
{
    public function getPath($file, $name, $id, $folderName)
    {
        $path = $file->storeAs(
            '/files' . '/' . $folderName . '/' . now()->format('dmy') . '_' . $id,
            $name,
            ['disk' => 'public']
        );

        return $path;
    }

    public function multipleUpload($files, $id, $label, $folderName)
    {
        foreach ($files as $key => $file) {
            $name = $key + 1 . '_' . now()->format('YmdHis') . '_' . auth()->user()->email . '-' . $label . '.' .
                $file->getClientOriginalExtension();
            // dd($this->getPath($file, $name, $id, $folderName));

            Upload::create([
                'request_id' => $id,
                'name' => $file->getClientOriginalName(),
                'filename' => $name,
                'path' => $this->getPath($file, $name, $id, $folderName),
                'label' => $label,
                'order' => $key + 1,
                'upload_date' => now()
            ]);
        }
    }

    public function singleUpload($order, $file, $id, $label, $folderName, $id_produk = null)
    {
        $name = $order . '_' . now()->format('YmdHis') . '_' . auth()->user()->email . '-' . $label . '.' .
            $file->getClientOriginalExtension();

        $version = Upload::where('request_id', $id)
                        ->where('label', $label)
                        ->where('id_produk', $id_produk)
                        ->count();

        $upload = Upload::create(
            [
                'request_id' => $id,
                'name' => $file->getClientOriginalName(),
                'filename' => $name,
                'path' => $this->getPath($file, $name, $id, $folderName),
                'label' => $label,
                'order' => $order,
                'tag' => $folderName,
                'upload_date' => now(),
                'id_produk' => $id_produk,
                'version' => $version+1
            ]
        );

        return $upload;
    }

    public function deleteUploadedFile($id, $label)
    {
        if (DB::table('uploads')->where('request_id', '=', $id)->exists()) {
            // dd('work');
            $fileDB = DB::table('uploads')->where('request_id', '=', $id)->where('label', '=', $label)->get();
            // dd($fileDB);
            foreach ($fileDB as $file) {
                // dd(file_exists('storage/' . $file->path));
                if (file_exists('storage/' . $file->path)) {
                    unlink('storage/' . $file->path);
                }
                //  else {
                //     dd('File does not exists.');
                // }
            }

            $upload = DB::table('uploads')->where('request_id', '=', $id)->where('label', '=', $label)->delete();
        }
    }

    public function deleteSelectedFile($idFile)
    {
        // if (DB::table('uploads')->where('request_id', '=', $id)->exists()) {
            // dd('work');
            $file = DB::table('uploads')->where('id', '=', $idFile)->first();
            // dd($file);
            if (file_exists('storage/' . $file->path)) {
                // dd("work");
                unlink('storage/' . $file->path);
                DB::table('uploads')->where('id', '=', $idFile)->delete();
                return back()->with('success', 'Selected file deleted successfully.');
            } else {
                return back()->with('error', 'Selected file not found. Failed to delete.');
            }
        // }
    }

    public function deleteUploadedFolder($id, $folderName)
    {
        if (DB::table('uploads')->where('request_id', '=', $id)->exists()) {
            $upload = DB::table('uploads')->where('request_id', '=', $id)->delete();
        }
        $folderPath = public_path('storage/files/' . $folderName . '/' . now()->format('dmy') . '_' . $id);
        // dd($folderPath);

        File::deleteDirectory($folderPath);
    }

    public function convertDateToTimestamp($stringDate)
    {

        $date = DateTime::createFromFormat(
            'd/m/Y',
            $stringDate,
            new DateTimeZone('UTC')
        );

        if ($date === false) {
            die("Incorrect date string");
        } else {
            return $date->getTimestamp();
        }
    }

    public function checkBetweenDate($startDate, $endDate)
    {
        // dd("Start Date : " . $startDate . " | End Date : " . $endDate);
        // Get Current Date
        $now = new DateTime("now", new DateTimeZone('Asia/Jakarta'));
        $tempDate = $now->format('Y-m-d');

        // Convert String -> Timestamp to Date
        $currentDate = strtotime($tempDate);
        $tempStartDate = strtotime($startDate);
        $tempEndDate = strtotime($endDate);

        // dd("Current Date : " . $currentDate . " | Start Date : " . $tempStartDate . " | End Date : " . $tempEndDate);

        if ($currentDate >= $tempStartDate && $currentDate <= $tempEndDate) {
            return true;
        } else {
            return false;
        }
    }
}
