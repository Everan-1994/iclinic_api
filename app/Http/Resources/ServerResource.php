<?php

namespace App\Http\Resources;

class ServerResource extends Resource
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
            'fwddm' => $this->fwddm,
            'zzjgdm' => $this->zzjgdm,
            'fwdmc' => $this->fwdmc,
            'fwdlx' => $this->fwdlx,
            'created_at' => $this->created_at->toDateTimeString(),
        ];
    }
}