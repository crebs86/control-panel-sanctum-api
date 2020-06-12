<?php

namespace App\Http\Controllers\BaseApp;

use App\Http\Controllers\Controller;
use App\Models\AppConfig;
use Illuminate\Http\Request;

class AppConfigController extends Controller
{
    public function appInfo(AppConfig $appConfig, Request $request){
        return response()->json($appConfig->where('config', $request->config)->get(['content']));
    }
}
