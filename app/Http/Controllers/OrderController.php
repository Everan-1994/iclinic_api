<?php

namespace App\Http\Controllers;

use App\Http\Resources\OrderResource;
use App\Models\Order;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Validator;

class OrderController extends Controller
{
    public function index(Request $request)
    {
        $order = Order::query()
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
            ->when($request->filled('cfmxid'), function ($query) use ($request) {
                $query->where('cfmxid', $request->input('cfmxid'));
            })
            ->orderBy($request->input('order', 'id'), $request->input('sort', 'desc'))
            ->paginate($request->input('pageSize', 10), ['*'], 'page', $request->input('page', 1));

        return $this->success([
            'data' => OrderResource::collection($order),
            'total' => $order->total(),
        ]);
    }

    protected function rules()
    {
        return [
            'jgdm' => 'required|string',
            'fwwddm' => 'required',
            'cfbh' => 'required',
            'cfmxid' => 'required',
            'kh' => 'required',
            'klx' => 'required',
            'cfklsj' => 'required',
            'cfyxts' => 'required',
            'xfklksbm' => 'required',
            'cfklksmc' => 'required',
            'mzh' => 'required',
            'xm' => 'required',
            'xbdm' => 'required',
            'csrq' => 'required',
            'nls' => 'required',
            'nly' => 'nullable',
            'jzrqsj' => 'required',
            'yzsm' => 'nullable',
            'pxh' => 'nullable',
            'yzxmlxdm' => 'required',
            'ypcfsx' => 'required',
            'zylbdm' => 'nullable',
            'cfmxybbm' => 'nullable',
            'ypid' => 'nullable',
            'cfmxmc' => 'required',
            'ypmc' => 'nullable',
            'ypgg' => 'nullable',
            'dddz' => 'nullable',
            'ywjxdm' => 'nullable',
            'ywsycjl' => 'nullable',
            'ywsyjldw' => 'nullable',
            'ywsypcdm' => 'nullable',
            'ywsypcmc' => 'nullable',
            'yytjdm' => 'nullable',
            'yytjmc' => 'nullable',
            'yysyzjl' => 'nullable',
            'cfypzh' => 'nullable',
            'zyypcf' => 'nullable',
            'zyypjs' => 'nullable',
            'zyypjzf' => 'nullable',
            'zyyyff' => 'nullable',
            'fyjl' => 'nullable',
            'fyjldw' => 'nullable',
            'dj' => 'required',
            'zje' => 'required',
            'cfklysgh' => 'nullable',
            'cfklysqm' => 'nullable',
            'cfshyjsgh' => 'nullable',
            'cfshyjsqm' => 'nullable',
            'cftpyjsgh' => 'nullable',
            'cftpyjsqm' => 'nullable',
            'cfhdyjsgh' => 'nullable',
            'cfhdyjsqm' => 'nullable',
            'cffyyjsgh' => 'nullable',
            'cffyyjsqm' => 'nullable',
            'zxjg' => 'nullable',
            'bz' => 'nullable',
            'qyjgdm' => 'nullable',
            'qyjgmc' => 'nullable',
            'mj'  => 'nullable',
            'sjscsj' => 'required',
            'tbrqsj' => 'required',
            'cxbz' => 'required'
        ];
    }

    /**
     * 新增门诊处方信息
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     * @throws \Illuminate\Validation\ValidationException
     */
    public function store(Request $request)
    {
        $rules = $this->rules();

        // 验证参数，如果验证失败，则会抛出 ValidationException 的异常
        $params = $this->validate($request, $rules);

        $result = Order::query()->create($params);

        if ($result) {
            return $this->success($result, '添加成功');
        }

        return $this->fail('添加失败');
    }

    /**
     * 门诊处方信息详情
     * @param $id
     * @return \Illuminate\Http\JsonResponse
     */
    public function show($id)
    {
        $validator = Validator::make(['id' => $id], [
            'id' => 'required|numeric',
        ]);

        $order = Order::query()->find($id);

        if ($order) {
            $data = optional($order)->toArray();
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
        $params['cfklsj'] = date('Y-m-d', $params['cfklsj']);
        $params['csrq'] = date('Y-m-d', $params['csrq']);
        $params['jzrqsj'] = date('Y-m-d', $params['jzrqsj']);
        $params['sjscsj'] = date('Y-m-d', $params['sjscsj']);

        $order = Order::query()->whereId($id)->update($params);

        if ($order) {
            return $this->success($order, '编辑成功');
        }

        return $this->fail('编辑失败');
    }

    /**
     * 删除门诊处方信息
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

        $numDestroied = Order::query()
            ->whereIn('id', collect($params['ids']))
            ->delete();

        if ($num == $numDestroied) {
            DB::commit();
            return $this->success([], '删除成功');
        }

        return $this->fail('删除失败');
    }
}
