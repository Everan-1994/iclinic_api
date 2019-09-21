<?php

namespace App\Http\Resources;

class HumanResource extends Resource
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
            'yhrygh' => $this->yhrygh,
            'yhryxm' => $this->yhryxm,
            'xb' => $this->xb,
            'created_at' => $this->created_at->toDateTimeString(),
        ];
    }
}
