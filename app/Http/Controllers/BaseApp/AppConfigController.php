<?php

namespace App\Http\Controllers\BaseApp;

use App\Http\Controllers\Controller;
use App\Models\AppConfig;
use Illuminate\Http\Request;

class AppConfigController extends Controller
{
    public function getAppConfig(Request $request)
    {
        if ($request->config === '*') {
            return response()->json(AppConfig::get(['content']));
        } else {
            return response()->json(AppConfig::where('config', $request->config)->get(['content']));
        }
    }
}
