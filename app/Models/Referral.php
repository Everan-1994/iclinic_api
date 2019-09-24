<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Referral extends Model
{
    use SoftDeletes;

    protected $table = 'treatment_referral';

    protected $fillable = [
        'jgdm', 'fwwddm', 'zzjlid',
        'kh', 'klx', 'mzh', 'xm', 'xbdm',
        'csrq', 'nls', 'nly', 'jzrqsj', 'fzysgh',
        'fzysxm', 'fzksbm', 'fzksmc', 'zzyy', 'zzsj',
        'zxjgdm', 'zxjgmc', 'zxksbm', 'zxksmc', 'zxysgh',
        'zxysxm', 'zyjws', 'zljg', 'xybzlfa', 'zzbz',
        'mj', 'sjscsj', 'tbrqsj', 'cxbz'
    ];

    public function setCsrqAttribute($csrq)
    {
        $this->attributes['csrq'] = date('Y-m-d', $csrq * 1);
    }

    public function setZzsjAttribute($zzsj)
    {
        $this->attributes['zzsj'] = date('Y-m-d', $zzsj * 1);
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
