<?php

namespace App\Http\Resources;

class ReferralResource extends Resource
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
            'fwwddm' => $this->fwwddm,
            'kh' => $this->kh,
            'zzjlid' => $this->zdxxid,
            'created_at' => $this->created_at->toDateTimeString(),
        ];
    }
}
