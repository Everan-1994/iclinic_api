<?php

namespace App\Http\Resources;

class OrganizationResource extends Resource
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
            'zzjgdm' => $this->zzjgdm,
            'jgmc' => $this->jgmc,
            'jglx' => $this->jglx,
            'created_at' => $this->created_at->toDateTimeString(),
        ];
    }
}