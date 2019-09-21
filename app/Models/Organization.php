<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Organization extends Model
{
    use SoftDeletes;

    protected $table = 'institution';

    protected $fillable = [
        'jgdm', 'zzjgdm', 'jgmc', 'xzqhdm', 'jglx', 'jgclrq',
        'dwlsgxdm', 'jgflgllbdm', 'jgfldm', 'jjlxdm', 'dz',
        'styyzzjgdm', 'styymc', 'styljgjb', 'styljgdj', 'hlwyywz', 'xkzhm',
        'xkxmmc', 'xkzyxq', 'xxaqdjbh', 'xxaqdjbhbh', 'kbzjjes', 'frdb',
        'jgszdmzzzdfbz', 'sffzjg', 'jgdemc', 'jgms', 'yzbm', 'dhhm',
        'dwdzyx', 'bz', 'sjscsj', 'tbrqsj', 'cxbz',
    ];

    public function setJgclrqAttribute($jgclrq)
    {
        $this->attributes['jgclrq'] = date('Y-m-d', $jgclrq * 1);
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
