<?php

namespace App\Http\Controllers;

use App\Http\Resources\DiagnoseResource;
use App\Models\Diagnose;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Validator;

class DiagnoseController extends Controller
{
    public function index(Request $request)
    {
        $diagnose = Diagnose::query()
            ->when($request->input('startTime') && $request->input('endTime'), function ($query) use ($request) {
                $query->whereBetween('created_at', [
                    date('Y-m-d H:i:s', $request->input('startTime')),
                    date('Y-m-d H:i:s', $request->input('endTime')),
                ]);
            })
            ->when($request->filled('keyword'), function ($query) use ($request) {
                $keyword = explode(' ', $request->input('keyword'));

                $sql = '';
                foreach ($keyword as $kw) {
                    $sql .= " concat(jgdm, fwwddm, kh) like '%" . $kw . "%' and";
                }

                return $query->whereRaw(substr($sql, 0, -4));
            })
            ->when($request->filled('zdxxid'), function ($query) use ($request) {
                $query->where('zdxxid', $request->input('zdxxid'));
            })
            ->orderBy($request->input('order', 'id'), $request->input('sort', 'desc'))
            ->paginate($request->input('pageSize', 10), ['*'], 'page', $request->input('page', 1));

        return $this->success([
            'data' => DiagnoseResource::collection($diagnose),
            'total' => $diagnose->total(),
        ]);
    }

    protected function rules()
    {
        return [
            'jgdm' => 'required|string',
            'fwwddm' => 'required',
            'zdxxid' => 'required',
            'kh' => 'required',
            'klx' => 'required',
            'mzh' => 'required',
            'xm' => 'required',
            'xbdm' => 'required',
            'csrq' => 'required',
            'nls' => 'required',
            'nly' => 'nullable',
            'jzrqsj' => 'required',
            'zdlxbm' => 'required',
            'xyzdbm' => 'nullable',
            'xyzdmc' => 'required',
            'xyzdbmlx' => 'required',
            'zyzdbm' => 'nullable',
            'zyzdmc' => 'nullable',
            'zyzdbmlx' => 'required',
            'zdsm' => 'required',
            'zdbz' => 'required',
            'zdysgh' => 'required',
            'zdysxm' => 'required',
            'zdsj' => 'nullable',
            'yl1' => 'nullable',
            'mj' => 'nullable',
            'sjscsj' => 'required',
            'tbrqsj' => 'required',
            'cxbz' => 'required'
        ];
    }

    /**
     * 新增医学诊断信息
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     * @throws \Illuminate\Validation\ValidationException
     */
    public function store(Request $request)
    {
        $rules = $this->rules();

        // 验证参数，如果验证失败，则会抛出 ValidationException 的异常
        $params = $this->validate($request, $rules);

        $result = Diagnose::query()->create($params);

        if ($result) {
            return $this->success($result, '添加成功');
        }

        return $this->fail('添加失败');
    }

    /**
     * 医学诊断信息详情
     * @param $id
     * @return \Illuminate\Http\JsonResponse
     */
    public function show($id)
    {
        $validator = Validator::make(['id' => $id], [
            'id' => 'required|numeric',
        ]);

        $diagnose = Diagnose::query()->find($id);

        if ($diagnose) {
            $data = optional($diagnose)->toArray();
            $data['tbrqsj'] = date('Y-m-d', $data['tbrqsj']);
            return $this->success($data);
        }

        return $this->fail('获取详情失败');
    }

    /**
     * @param Request $request
     * @param $id
     * @return \Illuminate\Http\JsonResponse
     * @throws \Illuminate\Validation\ValidationException
     */
    public function update($id, Request $request)
    {
        $rules = $this->rules();

        // 验证参数，如果验证失败，则会抛出 ValidationException 的异常
        $params = $this->validate($request, $rules);

        $validator = Validator::make(['id' => $id], [
            'id' => 'required|int',
        ]);

        // 修改部分数据格式
        $params['zdsj'] = date('Y-m-d', $params['zdsj']);
        $params['jzrqsj'] = date('Y-m-d', $params['jzrqsj']);
        $params['sjscsj'] = date('Y-m-d', $params['sjscsj']);

        $diagnose = Diagnose::query()->whereId($id)->update($params);

        if ($diagnose) {
            return $this->success($diagnose, '编辑成功');
        }

        return $this->fail('编辑失败');
    }

    /**
     * 删除医学诊断信息
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     * @throws \Illuminate\Validation\ValidationException
     */
    public function delete(Request $request)
    {
        $params = $this->validate($request, [
            'ids' => 'required|array|min:1',
            'ids.*' => 'required|distinct|int',
        ]);

        $num = count($params['ids']);

        $numDestroied = Diagnose::query()
            ->whereIn('id', collect($params['ids']))
            ->delete();

        if ($num == $numDestroied) {
            DB::commit();
            return $this->success([], '删除成功');
        }

        return $this->fail('删除失败');
    }
}
