<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Device extends Model
{
    use SoftDeletes;

    protected $table = 'device';

    protected $fillable = [
        'jgdm', 'sbdh', 'sbmc', 'tpsbts', 'cd', 'sccj',
        'sbxh', 'sbcs', 'sblx', 'gmrq', 'yt',
        'sbjzje', 'gjsxqk', 'llsjsm', 'syqk', 'bz',
        'sjscsj', 'tbrqsj', 'cxbz',
    ];

    public function setGmrqAttribute($gmrq)
    {
        $this->attributes['gmrq'] = date('Y-m-d', $gmrq * 1);
    }

    public function setSjscsjAttribute($sjscsj)
    {
        $this->attributes['sjscsj'] = date('Y-m-d', $sjscsj * 1);
    }
}
