<?php

namespace App\Http\Requests\BaseApp;

use Illuminate\Foundation\Http\FormRequest;

class ProfileRequest extends FormRequest
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
            'branch_line' => 'required|max:55',
            'address' => 'required|max:155',
            'sector' => 'required|max:55',
            'full_name' => 'required|max:105',
            'avatar' => 'nullable|max:55',
        ];
    }

    public function messages()
    {
        return [
            'full_name.required'=>'The alias field is required.',
            'full_name.max'=>'The alias may not be greater than 1 characters.',
        ];
    }
}
