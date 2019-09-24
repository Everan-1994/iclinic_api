<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class SelectController extends Controller
{
    public function getSelectList(Request $request)
    {
        if (!$request->filled('name')) {
            return $this->fail(10400, '缺少参数');
        }

        $name = $request->input('name');

        $list = DB::table('code_' . $name)->orderBy('code', 'asc')->get();

        return $this->success($list->isNotEmpty() ? $list->toArray() : []);
    }
}
