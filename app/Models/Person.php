<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Person extends Model
{
    use SoftDeletes;

    protected $table = 'person';

    protected $fillable = [
        'jgdm', 'kh', 'klx', 'zjhm', 'zjlbdm',
        'xm', 'xbdm', 'xbmc', 'hzsx', 'hyztdm',
        'hyztmc', 'csrq', 'mzdm', 'mzmc', 'gjdm',
        'gjmc', 'jgnbdah', 'gddhhm', 'sjhm', 'dzyj',
        'whcddm', 'whcdmc', 'zylbdm', 'zylbmc', 'csdxzqhm',
        'csd', 'jzdxzqhm', 'jzdz', 'hkdxzqhm', 'hkdz', 'lxrxm',
        'lxrdh', 'abo', 'rh', 'cblbdm', 'grdaid', 'yl1',
        'yl2', 'sjscsj', 'tbrqsj', 'mj', 'cxbz',
    ];

    public function setCsrqAttribute($csrq)
    {
        $this->attributes['csrq'] = date('Y-m-d', $csrq * 1);
    }

    public function setSjscsjAttribute($sjscsj)
    {
        if (!empty($sjscsj)) {
            $this->attributes['sjscsj'] = date('Y-m-d', $sjscsj * 1);
        }

        $this->attributes['sjscsj'] = null;
    }
}
