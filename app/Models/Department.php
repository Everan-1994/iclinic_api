<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Department extends Model
{
    use SoftDeletes;

    protected $table = 'department';

    protected $fillable = [
        'jgdm','ksbm', 'ybjdm',
        'ksmc', 'bzksdm', 'ksjs',
        'sjscsj', 'tbrqsj', 'cxbz'
    ];

    public function setSjscsjAttribute($sjscsj)
    {
        $this->attributes['sjscsj'] = date('Y-m-d', $sjscsj * 1);
    }
}
