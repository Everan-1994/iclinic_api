<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Order extends Model
{
    use SoftDeletes;

    protected $table = 'treatment_order';

    protected $fillable = [
        'jgdm', 'fwwddm', 'cfbh',
        'cfmxid', 'kh', 'klx', 'cfklsj', 'cfyxts', 'xfklksbm',
        'cfklksmc', 'mzh', 'xm', 'xbdm', 'csrq', 'nls', 'nly',
        'jzrqsj', 'yzsm', 'pxh', 'yzxmlxdm', 'ypcfsx', 'zylbdm',
        'cfmxybbm', 'ypid', 'cfmxmc', 'ypmc', 'ypgg', 'dddz',
        'ywjxdm', 'ywsycjl', 'ywsyjldw', 'ywsypcdm', 'ywsypcmc', 'yytjdm',
        'yytjmc', 'yysyzjl', 'cfypzh', 'zyypcf', 'zyypjs', 'zyypjzf',
        'zyyyff', 'fyjl', 'fyjldw', 'dj', 'zje', 'cfklysgh', 'cfklysqm',
        'cfshyjsgh', 'cfshyjsqm', 'cftpyjsgh', 'cftpyjsqm', 'cfhdyjsgh', 'cfhdyjsqm',
        'cffyyjsgh', 'cffyyjsqm', 'zxjg', 'bz', 'qyjgdm', 'qyjgmc',
        'mj', 'sjscsj', 'tbrqsj', 'cxbz'
    ];

    public function setCfklsjAttribute($cfklsj)
    {
        $this->attributes['cfklsj'] = date('Y-m-d', $cfklsj * 1);
    }

    public function setCsrqAttribute($csrq)
    {
        $this->attributes['csrq'] = date('Y-m-d', $csrq * 1);
    }

    public function setJzrqsjAttribute($jzrqsj)
    {
        $this->attributes['jzrqsj'] = date('Y-m-d', $jzrqsj * 1);
    }

    public function setSjscsjAttribute($sjscsj)
    {
        $this->attributes['sjscsj'] = date('Y-m-d', $sjscsj * 1);
    }
}
