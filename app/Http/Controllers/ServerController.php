<?php

namespace App\Http\Controllers;

use App\Http\Resources\ServerResource;
use App\Models\Server;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Validator;

class ServerController extends Controller
{
    public function index(Request $request)
    {
        $server = Server::query()
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
                    $sql .= " concat(fwddm, fwdmc, zzjgdm) like '%" . $kw . "%' and";
                }

                return $query->whereRaw(substr($sql, 0, -4));
            })
            ->when($request->filled('fwdlx'), function ($query) use ($request) {
                $query->where('fwdlx', $request->input('fwdlx'));
            })
            ->orderBy($request->input('order', 'id'), $request->input('sort', 'desc'))
            ->paginate($request->input('pageSize', 10), ['*'], 'page', $request->input('page', 1));

        return $this->success([
            'data' => ServerResource::collection($server),
            'total' => $server->total(),
        ]);
    }

    protected function rules()
    {
        return [
            'jgdm' => 'required|string',
            'zzjgdm' => 'required',
            'fwwddm' => 'required',
            'fwdmc' => 'required',
            'xzqhdm' => 'required',
            'fwdlx' => 'required',
            'fwdclrq' => 'required',
            'dwlsgxdm' => 'required',
            'fwdflgllbdm' => 'required',
            'fwdfldm' => 'required',
            'jjlxdm' => 'required',
            'dz' => 'required',
            'fwdyyjb' => 'required',
            'fwdyydj' => 'required',
            'hlwyywz' => 'required',
            'xkzhm' => 'required',
            'xkxmmc' => 'required',
            'xkzyxq' => 'required',
            'kbzjjes' => 'required',
            'frdb' => 'required',
            'fwdszdmzzzdfbz' => 'required',
            'sffzjg' => 'required',
            'fwddemc' => 'nullable',
            'fwdms' => 'nullable',
            'yzbm' => 'nullable',
            'dhhm' => 'nullable',
            'dwdzyx' => 'nullable',
            'bz' => 'nullable',
            'sjscsj' => 'required',
            'tbrqsj' => 'required',
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

        $result = Server::query()->create($params);

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

        $server = Server::query()->find($id);

        if ($server) {
            $data = optional($server)->toArray();
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
        $params['fwdclrq'] = date('Y-m-d', $params['fwdclrq']);
        $params['sjscsj'] = date('Y-m-d', $params['sjscsj']);
        $params['xkzyxq'] = date('Y-m-d', $params['xkzyxq']);

        $server = Server::query()->whereId($id)->update($params);

        if ($server) {
            return $this->success($server, '编辑成功');
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
            'ids' => 'required|array|min:1',
            'ids.*' => 'required|distinct|int',
        ]);

        $num = count($params['ids']);

        $numDestroied = Server::query()
            ->whereIn('id', collect($params['ids']))
            ->delete();

        if ($num == $numDestroied) {
            DB::commit();
            return $this->success([], '删除成功');
        }

        return $this->fail('删除失败');
    }
}
