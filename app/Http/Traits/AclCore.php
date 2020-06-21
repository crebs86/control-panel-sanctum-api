<?php


namespace App\Http\Traits;
/**
 * @method bool hasRole(array | string $role)
 * @method bool hasPermission(array | string $permission)
 * @method string getMessageError(string $message)
 * @method int getCodeError(int $code)
 * @method void setCodeError(int $code)
 * @method void can(string $permission)
 *
 * @see AclRoles
 * @see AclPermissions
 */

use App\Exceptions\BaseApp\Ability;
use App\Models\User;

trait AclCore
{
    use AclRoles, AclPermissions;

    /**
     * @var array
     */
    private $roles = [];
    /**
     * @var null
     */
    private $user = null;
    /**
     * @var int
     */
    private $codeError = 403;
    /**
     * @var string
     */
    private $messageError = 'You don\'t have permission for this!';

    private $dataData = null;

    /**
     * AclCore constructor.
     * @param User $user
     */
    public function __construct(User $user)
    {
        $this->user = $user->find(auth('sanctum')->id());
        if ($this->user) {
            $this->roles = $this->user->roles;
        }
    }

    /**
     * @param null $permission
     */
    public function can($permission = null): void
    {
        if (!($this->hasPermission(is_array($permission) ? $permission : func_get_args()))) {
            throw Ability::withMessage([
                'message' => $this->getMessageError(),
                'code' => $this->getCodeError()
            ]);
        }
    }

    /**
     * @return string
     */
    public function getMessageError(): string
    {
        return $this->messageError;
    }

    /**
     * @param string $messageError
     * @return $this|object
     */
    public function setMessageError(string $messageError): object
    {
        $this->messageError = $messageError;
        return $this;
    }

    /**
     * @return int
     */
    public function getCodeError(): int
    {
        return $this->codeError;
    }

    /**
     * @param int $codeError
     * @return $this|object
     */
    public function setCodeError(int $codeError): object
    {
        $this->codeError = $codeError;
        return $this;
    }

    /**
     * @param $collect
     * @param string $key
     * @return array
     */
    private function valueIds($collect, $key = 'id')
    {
        $b = [];
        foreach ($collect as $aa) {
            $b[] = $aa[$key];
        }
        return $b;
    }
}
