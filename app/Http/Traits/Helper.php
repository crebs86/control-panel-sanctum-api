<?php


namespace App\Http\Traits;


use App\Models\AppConfig;

trait Helper
{
    public function getConfig($config)
    {
        return AppConfig::where('config', $config)->get(['content']);
    }
}
