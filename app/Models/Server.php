<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Server extends Model
{
    use SoftDeletes;

    protected $table = 'service_point';

    protected $fillable = [
        'jgdm', 'zzjgdm', 'fwwddm', 'fwdmc', 'xzqhdm', 'fwdlx', 'fwdclrq',
        'dwlsgxdm', 'fwdflgllbdm', 'fwdfldm', 'jjlxdm', 'dz',
        'fwdyyjb', 'fwdyydj', 'hlwyywz', 'xkzhm', 'xkxmmc', 'xkzyxq',
        'kbzjjes', 'frdb', 'fwdszdmzzzdfbz', 'sffzjg', 'fwddemc','fwdms',
        'yzbm', 'dhhm', 'dwdzyx', 'bz', 'sjscsj', 'tbrqsj', 'cxbz',
    ];

    public function setFwdclrqAttribute($fwdclrq)
    {
        $this->attributes['fwdclrq'] = date('Y-m-d', $fwdclrq * 1);
    }

    public function setSjscsjAttribute($sjscsj)
    {
        $this->attributes['sjscsj'] = date('Y-m-d', $sjscsj * 1);
    }

    public function setXkzyxqAttribute($xkzyxq)
    {
        $this->attributes['xkzyxq'] = date('Y-m-d', $xkzyxq * 1);
    }
}
