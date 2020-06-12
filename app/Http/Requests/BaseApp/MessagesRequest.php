<?php

namespace App\Http\Requests\BaseApp;

use Illuminate\Foundation\Http\FormRequest;

class MessagesRequest extends FormRequest
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
            'conversation' => 'nullable',
            'to' => 'required',
            'message' => 'required|min:1',
        ];
    }

    public function messages()
    {
        return [
            'conversation.int'=>'Invalid data',
            'message.required'=>'Hey, write something!',
            'message.min'=>'You don\'t wanna talk to me!?'
        ];
    }
}
