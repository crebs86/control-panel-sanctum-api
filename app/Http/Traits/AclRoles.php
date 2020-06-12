<?php


namespace App\Http\Traits;


trait AclRoles
{
    /**
     * @return bool
     */
    public function isAdmin(): bool
    {
        return $this->hasRole('admin');
    }

    /**
     * @param $role
     * @return bool
     */
    public function hasRole($role): bool
    {
        $items = is_array($role) ? $role : func_get_args();
        foreach ($items as $v) {
            if (collect($this->getRoles())->contains('name', '===', $v)) {
                return true;
                break;
            }
        }
        return false;
    }

    /**
     * @return object
     */
    public function getRoles(): object
    {
        return $this->roles;
    }

    /**
     * @return bool
     */
    public function isSuperAdmin(): bool
    {
        return $this->hasRole('super-admin');
    }
}
