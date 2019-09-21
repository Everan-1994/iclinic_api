<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Human extends Model
{
    use SoftDeletes;

    protected $table = 'staff';

    protected $fillable = [
        'jgdm', 'yhrygh', 'yhryxm', 'xb', 'csrq',
        'sfzh', 'ksdm', 'zyjszwdm', 'zyjszwlbdm', 'zzlbmc', 'zgzsbm',
        'zghdsj', 'zyzsbm', 'fzrq', 'zydd', 'zyfw', 'zyzyyljgdm',
        'zyzyyymc', 'qkysbz', 'sjhm', 'zc', 'mc', 'cjgzrq',
        'zcsj', 'xl', 'grzpcfdz', 'zgzcfdz', 'zyzcfdz',
        'sjscsj', 'tbrqsj', 'cxbz'
    ];

    public function setFzrqAttribute($fzrq)
    {
        $this->attributes['fzrq'] = date('Y-m-d', $fzrq * 1);
    }

    public function setZghdsjAttribute($zghdsj)
    {
        $this->attributes['zghdsj'] = date('Y-m-d', $zghdsj * 1);
    }

    public function setZcsjAttribute($zcsj)
    {
        $this->attributes['zcsj'] = date('Y-m-d', $zcsj * 1);
    }

    public function setCjgzrqAttribute($cjgzrq)
    {
        $this->attributes['cjgzrq'] = date('Y-m-d', $cjgzrq * 1);
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
