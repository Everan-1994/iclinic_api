## 第一步：clone 项目后在根目录 执行以下命令 进行项目依赖安装

```composer install```

## 第二步：新建数据库，然后将数据库文件导入数据库

注意：无需执行 migrate 和 数据填充

## 第三步：执行 以下命令 生成 jwt 密钥

```php artisan jwt:secret```

## 注意事项：
nginx 配置好后，出现访问错误，首先考虑 是否给到 storage/logs 目录 775 以上权限


