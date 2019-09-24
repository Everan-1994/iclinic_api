<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Diagnose extends Model
{
    use SoftDeletes;

    protected $table = 'treatment_diagnose';

    protected $fillable = [
        'jgdm', 'fwwddm', 'zdxxid', 'kh',
        'klx', 'mzh', 'xm', 'xbdm', 'csrq',
        'nls', 'nly', 'jzrqsj', 'zdlxbm', 'xyzdbm', 'xyzdmc',
        'xyzdbmlx', 'zyzdbm', 'zyzdmc', 'zyzdbmlx', 'zdsm',
        'zdbz', 'zdysgh', 'zdysxm', 'zdsj', 'yl1', 'mj',
        'sjscsj', 'tbrqsj', 'cxbz'
    ];

    public function setCsrqAttribute($csrq)
    {
        $this->attributes['csrq'] = date('Y-m-d', $csrq * 1);
    }

    public function setZdsjAttribute($zdsj)
    {
        $this->attributes['zdsj'] = date('Y-m-d', $zdsj * 1);
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
