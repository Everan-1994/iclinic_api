<?php

namespace App\Http\Controllers;

use App\Http\Resources\PersonResource;
use App\Models\Person;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Validator;

class PersonController extends Controller
{
    public function index(Request $request)
    {
        $person = Person::query()
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
                    $sql .= " concat(xm, kh, jgdm) like '%" . $kw . "%' and";
                }

                return $query->whereRaw(substr($sql, 0, -4));
            })
            ->orderBy($request->input('order', 'id'), $request->input('sort', 'desc'))
            ->paginate($request->input('pageSize', 10), ['*'], 'page', $request->input('page', 1));

        return $this->success([
            'data'  => PersonResource::collection($person),
            'total' => $person->total(),
        ]);
    }

    protected function rules()
    {
        return [
            'jgdm' => 'required|string',
            'kh' => 'required|string',
            'klx' => 'required|string',
            'zjhm' => 'nullable',
            'zjlbdm' => 'nullable',
            'xm' => 'required',
            'xbdm' => 'required',
            'xbmc' => 'required',
            'hzsx' => 'nullable',
            'hyztdm' => 'nullable',
            'hyztmc' => 'nullable',
            'csrq' => 'required',
            'mzdm' => 'nullable',
            'mzmc' => 'nullable',
            'gjdm' => 'nullable',
            'gjmc' => 'nullable',
            'jgnbdah' => 'nullable',
            'gddhhm' => 'nullable',
            'sjhm' => 'nullable',
            'dzyj' => 'nullable',
            'whcddm' => 'nullable',
            'whcdmc' => 'nullable',
            'zylbdm' => 'nullable',
            'zylbmc' => 'nullable',
            'csdxzqhm' => 'nullable',
            'csd' => 'nullable',
            'jzdxzqhm' => 'nullable',
            'jzdz' => 'nullable',
            'hkdxzqhm' => 'nullable',
            'hkdz' => 'nullable',
            'lxrxm' => 'nullable',
            'lxrdh' => 'nullable',
            'abo' => 'nullable',
            'rh' => 'nullable',
            'cblbdm' => 'nullable',
            'grdaid' => 'nullable',
            'yl1' => 'nullable',
            'yl2' => 'nullable',
            'sjscsj' => 'nullable',
            'tbrqsj' => 'required',
            'mj' => 'nullable',
            'cxbz' => 'required'
        ];
    }

    /**
     * 新增个人信息
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     * @throws \Illuminate\Validation\ValidationException
     */
    public function store(Request $request)
    {
        $rules = $this->rules();

        // 验证参数，如果验证失败，则会抛出 ValidationException 的异常
        $params = $this->validate($request, $rules);

        $result = Person::query()->create($params);

        if ($result) {
            return $this->success($result, '添加成功');
        }

        return $this->fail('添加失败');
    }

    /**
     * 个人信息详情
     * @param $id
     * @return \Illuminate\Http\JsonResponse
     */
    public function show($id)
    {
        $validator = Validator::make(['id' => $id], [
            'id' => 'required|numeric',
        ]);

        $person = Person::query()->find($id);

        if ($person) {
            $data = optional($person)->toArray();
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

        if (empty($params['sjscsj'])) {
            $params['sjscsj'] = null;
        }

        $person = Person::query()->whereId($id)->update($params);

        if ($person) {
            return $this->success($person, '编辑成功');
        }

        return $this->fail('编辑失败');
    }

    /**
     * 删除个人信息
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     * @throws \Illuminate\Validation\ValidationException
     */
    public function delete(Request $request)
    {
        $params = $this->validate($request, [
            'ids'   => 'required|array|min:1',
            'ids.*' => 'required|distinct|int',
        ]);

        $num = count($params['ids']);

        $numDestroied = Person::query()
            ->whereIn('id', collect($params['ids']))
            ->delete();

        if ($num == $numDestroied) {
            DB::commit();
            return $this->success([], '删除成功');
        }

        return $this->fail('删除失败');
    }
}