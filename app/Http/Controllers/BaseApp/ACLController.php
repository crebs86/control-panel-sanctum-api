<?php

namespace App\Http\Controllers\BaseApp;

use App\Http\Controllers\Controller;
use App\Http\Requests\BaseApp\PermissionsRequest;
use App\Http\Requests\BaseApp\RolesRequest;
use App\Http\Traits\AclCore;
use App\Models\Permission;
use App\Models\PermissionRole;
use App\Models\Role;
use App\Models\RoleUser;
use Illuminate\Http\Request;

class ACLController extends Controller
{
    use AclCore;

    /**
     * Get all roles
     *
     * @param Role $role
     * @return \Illuminate\Http\JsonResponse
     */
    public function roles(Role $role)
    {
        $this->can('acl_view', 'acl_manager', 'super-admin');
        return response()->json($role->where('name', '<>', 'super-admin')->where('name', '<>', 'admin')->get());
    }

    /**
     * Get Admin roles
     *
     * @param Role $role
     * @return \Illuminate\Http\JsonResponse
     */
    public function adminRoles(Role $role)
    {
        if ($this->isSuperAdmin()) {
            return response()->json($role
                ->where('name', 'super-admin')
                ->orWhere('name', 'admin')
                ->get());
        } else {
            return response()->json();
        }
    }

    /**
     * Get permissions
     *
     * @param Permission $permission
     * @return \Illuminate\Http\JsonResponse
     */
    public function permissions(Permission $permission)
    {
        $this->can('acl_view', 'acl_manager', 'super-admin');
        return response()->json($permission
            ->where('name', '<>', 'acl_manager')
            ->get());
    }

    /**
     * Get Admin permissions
     *
     * @param Permission $permission
     * @return \Illuminate\Http\JsonResponse
     */
    public function adminPermissions(Permission $permission)
    {
        if ($this->isSuperAdmin()) {
            return response()->json($permission
                ->where('name', 'acl_manager')
                ->get());
        } else {
            return response()->json();
        }
    }

    /**
     * Create a new role
     *
     * @param RolesRequest $request
     * @param Role $role
     * @return \Illuminate\Http\JsonResponse
     */
    public function newRole(RolesRequest $request, Role $role)
    {
        $this->can('acl_manager', 'super-admin');
        $a = $role->create($request->all());
        return response()->json([
            'role' => $a,
            'message' => 'Role ' . $request->name . ' created'
        ]);
    }

    /**
     * Create a new permission
     *
     * @param PermissionsRequest $request
     * @param Permission $permission
     * @return \Illuminate\Http\JsonResponse
     */
    public function newPermission(PermissionsRequest $request, Permission $permission)
    {
        $this->can('acl_manager', 'super-admin');
        $a = $permission->create($request->all());
        return response()->json([
            'role' => $a,
            'message' => 'Permission ' . $request->name . ' created'
        ]);
    }

    /**
     * @param Role $role
     * @param Permission $permission
     * @return \Illuminate\Http\JsonResponse
     */
    public function permissionsRoles(Role $role)
    {
        $this->can('acl_manager', 'super-admin');
        return response()->json($role->all('id', 'name', 'label')->load('permissions'));
    }

    /**
     * @param Request $request
     * @param Role $role
     * @return \Illuminate\Http\JsonResponse
     */
    public function saveACL(Request $request, Role $role)
    {
        $this->can('acl_manager', 'super-admin');
        $a = $role->select('id', 'name', 'label')->where('id', $request->id)->get()->load('permissions')->toArray();
        $b = $this->valueIds($a[0]['permissions']);
        $this->savePermissionsOnRole(array_diff($request->ids, $b), array_diff($b, $request->ids), (int)$request->id);
        return response()->json([
            'message' => 'Data updated successfully'
        ]);
    }

    /**
     * @param array $add
     * @param array $remove
     * @param int $role
     */
    private function savePermissionsOnRole(array $add, array $remove, int $role)
    {
        $this->can('acl_manager', 'super-admin');
        foreach ($add as $value) {
            $a = PermissionRole::where('role_id', $role)->where('permission_id', $value)->get()->toArray();
            if (count($a) === 0) {
                $b = new PermissionRole();
                $b->role_id = $role;
                $b->permission_id = $value;
                $b->save();
            }
        }
        foreach ($remove as $value) {
            PermissionRole::where('role_id', $role)->where('permission_id', $value)->delete();
        }
    }

    /**
     * @param Request $request
     * @param Role $role
     * @return \Illuminate\Http\JsonResponse
     */
    public function rolePermissions(Request $request, Role $role)
    {
        $this->can('acl_manager', 'super-admin');
        $a = $role->select('id', 'name', 'label')->where('id', $request->id)->get()->load('permissions')->toArray();
        $b = $this->valueIds($a[0]['permissions']);
        return response()->json([
            'permissions' => $a,
            'ids' => $b
        ]);
    }

    /**
     * @param Request $request
     * @param Role $roleUser
     * @return \Illuminate\Http\JsonResponse
     */
    public function saveRoleUser(Request $request, RoleUser $roleUser)
    {
        $this->can('acl_manager', 'super-admin');
        $a = $roleUser->select('role_id')->where('user_id', $request->id)->get()->toArray();
        $b = $this->valueIds($a, 'role_id');
        $this->saveRoleOnUser(array_diff($request->ids, $b), array_diff($b, $request->ids), (int)$request->id);
        return response()->json([
            'message' => 'Data updated successfully'
        ]);
    }

    /**
     * @param array $add
     * @param array $remove
     * @param int $user
     */
    private function saveRoleOnUser(array $add, array $remove, int $user)
    {
        $this->can('acl_manager', 'super-admin');
        foreach ($add as $value) {
            if (($value === 1 || $value === 2 && $this->isSuperAdmin()) || $value !== 1 && $value !== 2) {
                $a = RoleUser::where('user_id', $user)->where('role_id', $value)->get()->toArray();
                if (count($a) === 0) {
                    $b = new RoleUser();
                    $b->user_id = $user;
                    $b->role_id = $value;
                    $b->save();
                }
            }
        }
        foreach ($remove as $value) {
            RoleUser::where('user_id', $user)->where('role_id', $value)->delete();
        }
    }

    /**
     * @param Request $request
     * @param RoleUser $roleUser
     * @return \Illuminate\Http\JsonResponse
     */
    public function loadRoleUser(Request $request, RoleUser $roleUser)
    {
        $this->can('acl_manager', 'super-admin');
        $a = $roleUser->select('role_id')->where('user_id', $request->id)->get()->toArray();
        $b = [];
        if (count($a) > 0) {
            $b = $this->valueIds($a, 'role_id');
        }
        return response()->json($b);
    }

    public function editAdminRoles(Request $request, RoleUser $roleUser)
    {
        $this->can('super-admin');
        $a = $roleUser->select('role_id')->where('user_id', $request->id)->get()->toArray();
        $b = $this->valueIds($a, 'role_id');
        $this->saveRoleOnUser(array_diff($request->ids, $b), array_diff($b, $request->ids), (int)$request->id);
        return response()->json([
            'message' => 'Data updated successfully'
        ]);
    }

    private function editAdminPermissionsOnRole(array $add, array $remove, int $role)
    {
        $this->can('super-admin');
        foreach ($add as $value) {
            if (($role === 1 && $role === 2 && $this->isSuperAdmin()) || $role !== 1 && $role !== 2) {
                $a = PermissionRole::where('role_id', $role)->where('permission_id', $value)->get()->toArray();
                if (count($a) === 0) {
                    $b = new PermissionRole();
                    $b->role_id = $role;
                    $b->permission_id = $value;
                    $b->save();
                }
            }
        }
        foreach ($remove as $value) {
            PermissionRole::where('role_id', $role)->where('permission_id', $value)->delete();
        }
    }
}
