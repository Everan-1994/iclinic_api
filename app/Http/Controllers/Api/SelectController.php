<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class SelectController extends Controller
{
    /**
     * 下拉选项
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function getSelectList(Request $request)
    {
        if (!$request->filled('name')) {
            return $this->fail(10400, '缺少参数');
        }

        $name = $request->input('name');

        $list = DB::table('code_' . $name)->orderBy('code', 'asc')->get();

        return $this->success($list->isNotEmpty() ? $list->toArray() : []);
    }

    /**
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     * @throws \Illuminate\Validation\ValidationException
     */
    public function store(Request $request)
    {
        $params = $this->validate($request, [
            'model' => 'required|string',
            'code' => 'required|unique:code_' . $request->input('model'),
            'name' => 'required|string',
        ], [
            'code.unique' => $request->input('code') . '编码已存在'
        ]);

        try {
            DB::table('code_' . $params['model'])->insert([
                'code' => $params['code'],
                'name' => $params['name']
            ]);
            return $this->success();
        }catch (\Exception $exception) {
            return $this->fail(10500, '添加失败');
        }
    }

    /**
     * 编辑
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     * @throws \Illuminate\Validation\ValidationException
     */
    public function update(Request $request)
    {
        $params = $this->validate($request, [
            'model' => 'required|string',
            'id' => 'required',
            'code' => 'required|uniqueSoftDelete:code_'. $request->input('model') .',code'.($request->input('id') ? ",{$request->input('id')},code" : ''),
            'name' => 'required|string',
        ]);

        $num = DB::table('code_' . $params['model'])
            ->whereCode($params['id'])
            ->update([
                'code' => $params['code'],
                'name' => $params['name'],
            ]);

        if ($num > 0) {
            return $this->success();
        }

        return $this->fail(10500, '更新失败');
    }

    /**
     * 删除
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     * @throws \Illuminate\Validation\ValidationException
     */
    public function delete(Request $request)
    {
        $params = $this->validate($request, [
            'model' => 'required|string',
            'ids' => 'required|array|min:1',
            'ids.*' => 'required|distinct',
        ]);

        DB::beginTransaction();
        $num = DB::table('code_' . $params['model'])
            ->whereIn('code', $params['ids'])
            ->delete();

        if ($num > 0) {
            DB::commit();
            return $this->success();
        } else {
            DB::rollBack();
            return $this->fail(10500, '删除失败');
        }
    }
}
