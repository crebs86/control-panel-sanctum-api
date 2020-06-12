<?php

namespace App\Http\Requests\BaseApp;

use Illuminate\Foundation\Http\FormRequest;

class TicketsRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        return [
            'department' => 'required|exists:ticket_types,id',
            'subject' => 'required|min:3|max:255',
            'description' => 'required|min:3',
        ];
    }
}
