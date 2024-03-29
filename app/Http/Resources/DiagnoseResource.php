<?php

namespace App\Http\Resources;

class DiagnoseResource extends Resource
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
            'zdxxid' => $this->zdxxid,
            'created_at' => $this->created_at->toDateTimeString(),
        ];
    }
}
