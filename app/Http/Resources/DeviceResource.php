<?php

namespace App\Http\Resources;

class DeviceResource extends Resource
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
            'sbdh' => $this->sbdh,
            'sbmc' => $this->sbmc,
            'sbxh' => $this->sbxh,
            'created_at' => $this->created_at->toDateTimeString(),
        ];
    }
}
