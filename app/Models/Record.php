<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Record extends Model
{
    use SoftDeletes;

    protected $table = 'treatment_record';

    protected $fillable = [
        'jgdm', 'fwwddm', 'jzlx',
        'kh', 'klx', 'mzh', 'ksbm', 'ksmc', 'xm',
        'xbdm', 'csrq', 'nls', 'nly', 'gmsbs', 'gms',
        'cblb', 'jzrqsj', 'jzzdsm', 'czbzdm', 'zs', 'xbs',
        'jws', 'fzjcxm', 'fzjcjg', 'mzzzzddm', 'mzzzzdmc', 'mzzzzdbmlx',
        'zzms', 'bzyj', 'zzzf', 'jkzd', 'czjh', 'yzysgh',
        'yzysjm', 'czylwsjgdm', 'czylswjgmc', 'jzjssj', 'zzbz', 'hzmyd',
        'yl1', 'yl2', 'dzcfwjcfdz', 'ysdspwjcfdz', 'hzdspwjcfdz', 'jlypcfdz',
        'sjscsj', 'tbrqsj', 'cxbz', 'mj'
    ];

    public function setJzrqsjAttribute($jzrqsj)
    {
        $this->attributes['jzrqsj'] = date('Y-m-d', $jzrqsj * 1);
    }

    public function setJzjssjAttribute($jzjssj)
    {
        if (!empty($jzjssj)) {
            $this->attributes['jzjssj'] = date('Y-m-d', $jzjssj * 1);
        }

        $this->attributes['jzjssj'] = null;
    }

    public function setCsrqAttribute($csrq)
    {
        $this->attributes['csrq'] = date('Y-m-d', $csrq * 1);
    }

    public function setSjscsjAttribute($sjscsj)
    {
        $this->attributes['sjscsj'] = date('Y-m-d', $sjscsj * 1);
    }
}
