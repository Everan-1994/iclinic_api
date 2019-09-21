<?php

namespace App\Http\Resources;

class DepartmentResource extends Resource
{
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request $request
     * @return array
     */
    public function toArray($request)
    {
        return [
            'id' => $this->id,
            'jgdm' => $this->jgdm,
            'ksbm' => $this->ksbm,
            'ksmc' => $this->ksmc,
            'bzksdm' => $this->bzksdm,
            'created_at' => $this->created_at->toDateTimeString(),
        ];
    }
}
