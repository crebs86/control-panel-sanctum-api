<?php


namespace App\Http\Traits;


use Illuminate\Support\Facades\Crypt;

trait CryptTrait
{
    /**
     * @var array
     */
    private $data = [];
    /**
     * @var array
     */
    private $slug = [];
    /**
     * @var string
     */
    private $method = 'base64';

    /**
     * @param $data
     * @param string[] $slug
     * @param string $method
     * @return array
     */
    public function encryptCollectData($data, $slug = ['id'], $method = 'base64')
    {
        $this->slug = $slug;
        $this->method = $method;
        $this->setDataAttributes($data);
        return $this->data;
    }

    /**
     * @param $data
     */
    private function setDataAttributes($data)
    {
        foreach ($data as $key => $value) {
            if (is_array($value)) {
                $this->data[$key] = $this->run($value);
            } else {
                if (in_array($key, $this->slug)) {
                    if ($this->method === 'base64') {
                        $this->data[$key] = base64_encode($value);
                    } else if ($this->method === 'encrypt') {
                        $this->data[$key] = $this->encrypt($value);
                    }else{
                        $this->data[$key] = $value;
                    }
                } else {
                    $this->data[$key] = $value;
                }
            }
        }
    }

    /**
     * @param $value
     * @return array
     */
    private function run($value)
    {
        $a = [];
        foreach ($value as $k => $v) {
            if (is_array($v)) {
                $a[$k] = $this->run($v);
            } elseif (is_object($v)) {
                $a[$k] = $this->run((array)$v);
            } else {
                if (in_array($k, $this->slug)) {
                    if ($this->method === 'base64') {
                        $a[$k] = base64_encode($v);
                    } else if ($this->method === 'encrypt') {
                        $a[$k] = $this->encrypt($v);
                    }
                } else {
                    $a[$k] = $v;
                }
            }
        }
        return $a;
    }

    /**
     * @param $data
     * @return string
     */
    public function encrypt($data)
    {
        return Crypt::encryptString($data);
    }

    /**
     * @param $data
     * @return string
     */
    public function decrypt($data)
    {
        return Crypt::decryptString($data);
    }
}
