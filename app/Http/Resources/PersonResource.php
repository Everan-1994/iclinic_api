<?php

namespace App\Http\Resources;

class PersonResource extends Resource
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
            'kh' => $this->kh,
            'xm' => $this->xm,
            'xbmc' => $this->xbmc,
            'created_at' => $this->created_at->toDateTimeString(),
        ];
    }
}