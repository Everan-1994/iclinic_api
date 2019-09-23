<?php

namespace App\Http\Controllers;

use App\Http\Resources\RecordResource;
use App\Models\Record;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Validator;

class RecordController extends Controller
{
    public function index(Request $request)
    {
        $diagnose = Record::query()
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
            ->when($request->filled('mzh'), function ($query) use ($request) {
                $query->where('mzh', $request->input('mzh'));
            })
            ->orderBy($request->input('order', 'id'), $request->input('sort', 'desc'))
            ->paginate($request->input('pageSize', 10), ['*'], 'page', $request->input('page', 1));

        return $this->success([
            'data' => RecordResource::collection($diagnose),
            'total' => $diagnose->total(),
        ]);
    }

    protected function rules()
    {
        return [
            'jgdm' => 'required|string',
            'fwwddm' => 'required',
            'jzlx' => 'required',
            'kh' => 'required',
            'klx' => 'required',
            'mzh' => 'required',
            'ksbm' => 'required',
            'ksmc' => 'required',
            'xm' => 'required',
            'xbdm' => 'required',
            'csrq' => 'required',
            'nls' => 'required',
            'nly' => 'nullable',
            'gmsbs' => 'required',
            'gms' => 'nullable',
            'cblb' => 'nullable',
            'jzrqsj' => 'required',
            'jzzdsm' => 'required',
            'czbzdm' => 'required',
            'zs' => 'nullable',
            'xbs' => 'nullable',
            'jws' => 'nullable',
            'fzjcxm' => 'nullable',
            'fzjcjg' => 'nullable',
            'mzzzzddm' => 'nullable',
            'mzzzzdmc' => 'nullable',
            'mzzzzdbmlx' => 'required',
            'zzms' => 'required',
            'bzyj' => 'required',
            'zzzf' => 'required',
            'jkzd' => 'required',
            'czjh' => 'required',
            'yzysgh' => 'required',
            'yzysjm' => 'required',
            'czylwsjgdm' => 'required',
            'czylswjgmc' => 'required',
            'jzjssj' => 'nullable',
            'zzbz' => 'nullable',
            'hzmyd' => 'nullable',
            'yl1' => 'nullable',
            'yl2' => 'nullable',
            'dzcfwjcfdz' => 'nullable',
            'ysdspwjcfdz' => 'nullable',
            'hzdspwjcfdz' => 'nullable',
            'jlypcfdz' => 'nullable',
            'mj'  => 'nullable',
            'sjscsj' => 'required',
            'tbrqsj' => 'required',
            'cxbz' => 'required'
        ];
    }

    /**
     * 新增门诊病历信息
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     * @throws \Illuminate\Validation\ValidationException
     */
    public function store(Request $request)
    {
        $rules = $this->rules();

        // 验证参数，如果验证失败，则会抛出 ValidationException 的异常
        $params = $this->validate($request, $rules);

        $result = Record::query()->create($params);

        if ($result) {
            return $this->success($result, '添加成功');
        }

        return $this->fail('添加失败');
    }

    /**
     * 门诊病历信息详情
     * @param $id
     * @return \Illuminate\Http\JsonResponse
     */
    public function show($id)
    {
        $validator = Validator::make(['id' => $id], [
            'id' => 'required|numeric',
        ]);

        $diagnose = Record::query()->find($id);

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
        $params['csrq'] = date('Y-m-d', $params['csrq']);
        $params['jzjssj'] = date('Y-m-d', $params['jzjssj']);
        $params['jzrqsj'] = date('Y-m-d', $params['jzrqsj']);
        $params['sjscsj'] = date('Y-m-d', $params['sjscsj']);

        $diagnose = Record::query()->whereId($id)->update($params);

        if ($diagnose) {
            return $this->success($diagnose, '编辑成功');
        }

        return $this->fail('编辑失败');
    }

    /**
     * 删除门诊病历信息
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

        $numDestroied = Record::query()
            ->whereIn('id', collect($params['ids']))
            ->delete();

        if ($num == $numDestroied) {
            DB::commit();
            return $this->success([], '删除成功');
        }

        return $this->fail('删除失败');
    }
}
