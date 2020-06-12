<?php


namespace App\Http\Traits;


trait AclPermissions
{
    /**
     * @var array
     */
    private $items = [];

    /**
     * @param $permission
     * @return bool
     */
    public function hasPermission($permission): bool
    {
        foreach (is_array($permission) ? $permission : func_get_args() as $v) {
            if (collect($this->getPermissions())->contains('name', '===', $v)) {
                return true;
                break;
            }
        }
        return false;
    }

    /**
     * @return array
     */
    public function getPermissions(): array
    {
        $this->setItems();
        return $this->getItems();
    }

    /**
     * set items
     * @return void
     */
    private function setItems(): void
    {
        foreach ($this->getRoles() as $roles) {
            foreach ($roles['permissions'] as $permissions) {
                $this->items[]['name'] = $permissions['name'];
            }
        }
    }

    /**
     * @return array
     */
    private function getItems(): array
    {
        return $this->items;
    }
}
