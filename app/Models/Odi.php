<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Odi extends Model
{
    use SoftDeletes;

    protected $table = 'institution_business';

    protected $fillable = [
        'jgdm', 'nf', 'pcjgsl', 'bspt', 'wljgtdz',
        'jgmsxx', 'jfmj', 'zgzs', 'khfwryzs', 'ywyfmj',
        'zsr', 'zzc', 'zzch', 'ldzc', 'dwtz',
        'gdzc', 'wxzcjkbf', 'fz',
        'jzc', 'sjscsj', 'tbrqsj', 'cxbz'
    ];

    public function setNfAttribute($nf)
    {
        $this->attributes['nf'] = date('Y-m', $nf * 1);
    }

    public function setSjscsjAttribute($sjscsj)
    {
        $this->attributes['sjscsj'] = date('Y-m-d', $sjscsj * 1);
    }
}
