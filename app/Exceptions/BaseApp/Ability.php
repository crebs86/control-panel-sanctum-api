<?php

namespace App\Exceptions\BaseApp;

use Symfony\Component\HttpKernel\Exception\HttpException;
use Throwable;

class Ability extends HttpException
{
    /**
     * Ability constructor.
     * @param int $statusCode
     * @param string|null $message
     * @param Throwable|null $previous
     * @param array $headers
     * @param int|null $code
     */
    public function __construct(int $statusCode, string $message = null, \Throwable $previous = null, array $headers = [], ?int $code = 0)
    {
        parent::__construct($statusCode, $message, $previous, $headers, $code);
    }

    /**
     * @param array $error
     * @return static
     */
    public static function withMessage(array $error)
    {
        return new static($error['code'], $error['message']);
    }

}
