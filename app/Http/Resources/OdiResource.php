<?php

namespace App\Http\Resources;

class OdiResource extends Resource
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
            'bspt' => $this->bspt,
            'nf' => date('Y-m', $this->nf),
            'zgzs' => $this->zgzs,
            'created_at' => $this->created_at->toDateTimeString(),
        ];
    }
}
