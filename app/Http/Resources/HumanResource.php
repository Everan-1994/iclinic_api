<?php

namespace App\Http\Resources;

use Carbon\Carbon;

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
            'csrq' => Carbon::parse($this->csrq)->toDateString(),
            'created_at' => $this->created_at->toDateTimeString(),
        ];
    }
}
