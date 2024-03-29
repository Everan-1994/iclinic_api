<?php

/** @var \Laravel\Lumen\Routing\Router $router */
$router->group([
    'prefix' => 'admin', // 前缀
], function ($router) {
    /* @var \Laravel\Lumen\Routing\Router $router */

    // 防止找不到 options 路由而报跨域错误
    $router->options('/{path:.*}', function ($path) {
    });

    // 管理员登录
    $router->post('login', 'AdminAuthController@login');

    // 上传图片
    $router->post('upload', 'UploadFile');

    // 需要 token 验证的接口
    $router->group(['middleware' => ['refresh.token', 'permission']], function ($router) {
        /* @var \Laravel\Lumen\Routing\Router $router */

        // 可访问权限列表
        $router->get('accessList', 'AdminAuthController@accessList');

        // 后端首页看板数据接口
        $router->get('board', 'AdminAuthController@board');

        // 退出登陆
        $router->delete('logout', 'AdminAuthController@logout');

        // 获取当前登录用户信息
        $router->get('info', 'AdminAuthController@info');

        // 修改当前登录用户密码
        $router->put('update', 'AdminAuthController@update');

        // 操作日志
        $router->get('operation', 'OperationController@index');

        // 路由
        $router->group(['prefix' => 'actions'], function ($router) {
            /* @var \Laravel\Lumen\Routing\Router $router */

            $router->get('/', 'ActionController@lists');                // 列表
            $router->post('/', 'ActionController@add');                 // 新增
            $router->put('/', 'ActionController@update');               // 更新
            $router->delete('/', 'ActionController@delete');            // 删除
            $router->get('/route', 'ActionController@route');           // Map
            $router->patch('/sort', 'ActionController@sort');           // 排序
        });

        // 角色
        $router->group(['prefix' => 'roles'], function ($router) {
            /* @var \Laravel\Lumen\Routing\Router $router */

            $router->get('/', 'RoleController@lists');                  // 列表
            $router->get('/{id:[0-9]+}', 'RoleController@detail');      // 详情
            $router->post('/', 'RoleController@add');                   // 新增
            $router->put('/', 'RoleController@update');                 // 更新
            $router->delete('/', 'RoleController@delete');              // 删除
        });

        // 成员
        $router->group(['prefix' => 'members'], function ($router) {
            /* @var \Laravel\Lumen\Routing\Router $router */

            $router->get('/', 'MemberController@lists');                    // 列表
            $router->get('/{id}', 'MemberController@detail');               // 详情
            $router->post('/', 'MemberController@add');                     // 新增
            $router->put('/', 'MemberController@update');                   // 更新
            $router->delete('/', 'MemberController@delete');                // 删除单个
            $router->patch('/', 'MemberController@changeStatus');           // 变更状态
        });

        // 区块
//        $router->group(['prefix' => 'block'], function ($router) {
//            /* @var \Laravel\Lumen\Routing\Router $router */
//            $router->get('/', 'BlockController@readAll'); // list
//            $router->get('{id:[0-9]+}', 'BlockController@read'); // detail
//            $router->post('/', 'BlockController@createOrUpdate'); // create
//            $router->put('/{id:[0-9]+}', 'BlockController@createOrUpdate'); // update
//            $router->delete('/', 'BlockController@delete'); // delete
//
//            // 区块内容
//            $router->get('/{blockId:[0-9]+}/item', 'BlockItemController@readAll'); // list
//            $router->group(['prefix' => 'item'], function ($router) {
//                $router->get('{id:[0-9]+}', 'BlockItemController@read'); // detail
//                $router->post('/', 'BlockItemController@createOrUpdate'); // create
//                $router->put('/{id:[0-9]+}', 'BlockItemController@createOrUpdate'); // update
//                $router->delete('/', 'BlockItemController@delete'); // delete
//                $router->patch('/sort', 'BlockItemController@sort'); // sort
//            });
//        });

        // 个人信息
        $router->group(['prefix' => 'person'], function ($router) {
            /* @var \Laravel\Lumen\Routing\Router $router */
            $router->post('/', 'PersonController@store');              // 新增
            $router->get('/', 'PersonController@index');               // 列表
            $router->get('/{id}', 'PersonController@show');            // 详情
            $router->put('/{id}', 'PersonController@update');          // 更新
            $router->delete('/', 'PersonController@delete');           // 删除
        });

        // 机构信息
        $router->group(['prefix' => 'organization'], function ($router) {
            /* @var \Laravel\Lumen\Routing\Router $router */
            $router->post('/', 'OrganizationController@store');              // 新增
            $router->get('/', 'OrganizationController@index');               // 列表
            $router->get('/{id}', 'OrganizationController@show');            // 详情
            $router->put('/{id}', 'OrganizationController@update');          // 更新
            $router->delete('/', 'OrganizationController@delete');           // 删除
        });

        // 服务点
        $router->group(['prefix' => 'server'], function ($router) {
            /* @var \Laravel\Lumen\Routing\Router $router */
            $router->post('/', 'ServerController@store');              // 新增
            $router->get('/', 'ServerController@index');               // 列表
            $router->get('/{id}', 'ServerController@show');            // 详情
            $router->put('/{id}', 'ServerController@update');          // 更新
            $router->delete('/', 'ServerController@delete');           // 删除
        });

        // 机构业务发展情况
        $router->group(['prefix' => 'odi'], function ($router) {
            /* @var \Laravel\Lumen\Routing\Router $router */
            $router->post('/', 'OdiController@store');              // 新增
            $router->get('/', 'OdiController@index');               // 列表
            $router->get('/{id}', 'OdiController@show');            // 详情
            $router->put('/{id}', 'OdiController@update');          // 更新
            $router->delete('/', 'OdiController@delete');           // 删除
        });

        // 机构业务发展情况
        $router->group(['prefix' => 'department'], function ($router) {
            /* @var \Laravel\Lumen\Routing\Router $router */
            $router->post('/', 'DepartmentController@store');              // 新增
            $router->get('/', 'DepartmentController@index');               // 列表
            $router->get('/{id}', 'DepartmentController@show');            // 详情
            $router->put('/{id}', 'DepartmentController@update');          // 更新
            $router->delete('/', 'DepartmentController@delete');           // 删除
        });

        // 人力资源
        $router->group(['prefix' => 'human'], function ($router) {
            /* @var \Laravel\Lumen\Routing\Router $router */
            $router->post('/', 'HumanController@store');              // 新增
            $router->get('/', 'HumanController@index');               // 列表
            $router->get('/{id}', 'HumanController@show');            // 详情
            $router->put('/{id}', 'HumanController@update');          // 更新
            $router->delete('/', 'HumanController@delete');           // 删除
        });

        // 设备资源
        $router->group(['prefix' => 'device'], function ($router) {
            /* @var \Laravel\Lumen\Routing\Router $router */
            $router->post('/', 'DeviceController@store');              // 新增
            $router->get('/', 'DeviceController@index');               // 列表
            $router->get('/{id}', 'DeviceController@show');            // 详情
            $router->put('/{id}', 'DeviceController@update');          // 更新
            $router->delete('/', 'DeviceController@delete');           // 删除
        });

        // 医学诊断
        $router->group(['prefix' => 'diagnose'], function ($router) {
            /* @var \Laravel\Lumen\Routing\Router $router */
            $router->post('/', 'DiagnoseController@store');              // 新增
            $router->get('/', 'DiagnoseController@index');               // 列表
            $router->get('/{id}', 'DiagnoseController@show');            // 详情
            $router->put('/{id}', 'DiagnoseController@update');          // 更新
            $router->delete('/', 'DiagnoseController@delete');           // 删除
        });

        // 门诊处方
        $router->group(['prefix' => 'order'], function ($router) {
            /* @var \Laravel\Lumen\Routing\Router $router */
            $router->post('/', 'OrderController@store');              // 新增
            $router->get('/', 'OrderController@index');               // 列表
            $router->get('/{id}', 'OrderController@show');            // 详情
            $router->put('/{id}', 'OrderController@update');          // 更新
            $router->delete('/', 'OrderController@delete');           // 删除
        });

        // 门诊病历
        $router->group(['prefix' => 'record'], function ($router) {
            /* @var \Laravel\Lumen\Routing\Router $router */
            $router->post('/', 'RecordController@store');              // 新增
            $router->get('/', 'RecordController@index');               // 列表
            $router->get('/{id}', 'RecordController@show');            // 详情
            $router->put('/{id}', 'RecordController@update');          // 更新
            $router->delete('/', 'RecordController@delete');           // 删除
        });

        // 转诊记录
        $router->group(['prefix' => 'referral'], function ($router) {
            /* @var \Laravel\Lumen\Routing\Router $router */
            $router->post('/', 'ReferralController@store');              // 新增
            $router->get('/', 'ReferralController@index');               // 列表
            $router->get('/{id}', 'ReferralController@show');            // 详情
            $router->put('/{id}', 'ReferralController@update');          // 更新
            $router->delete('/', 'ReferralController@delete');           // 删除
        });

        // 下拉选项
        $router->get('/select', 'Api\SelectController@getSelectList');    // 列表
        $router->post('/select', 'Api\SelectController@store');           // 新增
        $router->put('/select', 'Api\SelectController@update');           // 编辑
        $router->delete('/select', 'Api\SelectController@delete');        // 删除
    });
});

/* @var \Laravel\Lumen\Routing\Router $router */
$router->group([
    'prefix' => '', // 前缀
], function ($router) {
    /* @var \Laravel\Lumen\Routing\Router $router */

});
