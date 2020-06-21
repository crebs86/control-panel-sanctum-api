<?php

namespace App\Http\Controllers\BaseApp;

use App\Http\Controllers\Controller;
use App\Http\Traits\AclCore;
use App\Models\Group;
use App\Models\UsersGroup;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Crypt;
use Illuminate\Support\Facades\Validator;

class UsersGroupsController extends Controller
{
    use AclCore;

    /**
     * create a active list groups
     * @param Group $group
     * @return array
     */
    public function listAll(Group $group)
    {
        $this->can('user_manager', 'user_view');
        $a = $group->withTrashed()->select('id', 'desc', 'slug', 'deleted_at')->get();
        $c = [];
        foreach ($a as $b):
            $c[] = [
                'id' => $b->id,
                'desc' => $b->desc,
                'slug' => $b->slug,
                'deleted_at' => $b->deleted_at ? date('Y-m-d H:i:s', strtotime($b->deleted_at)) : null,
                '_check' => Crypt::encryptString($b->id)
            ];
        endforeach;
        return $c;
    }

    /**
     * @param Group $group
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function usersGroupId(Group $group, Request $request)
    {
        $this->can('user_manager', 'user_view');
        $a = $group->find($request->id)->load('users_id');
        $b = [];
        if ($a->users_id) {
            foreach ($a->users_id as $aa) {
                $b[] = $aa['user_id'];
            }
        }
        return response()->json([$b]
        );
    }

    /**
     * create a active list groups
     * @param Group $group
     * @return array
     */
    public function list(Group $group)
    {
        $this->can('user_manager', 'user_view');
        return $group->all(['id', 'slug', 'desc']);

    }

    /**
     * @param Group $group
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function usersGroupsWithName(Request $request)
    {
        return response()->json(Group::withTrashed()->find($request->group)->load('users_group_with_name')->toArray());
    }

    /**
     * edit a group
     * @param Group $group
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function edit(Group $group, Request $request)
    {
        $this->can('user_manager', 'user_edit');
        if ((int)$request->id === (int)Crypt::decryptString($request->_check)) {
            $a = $group->withTrashed()->select('id')->find($request->id);
            $a->slug = $request->slug;
            $a->desc = $request->desc;
            $a->save();
            return response()->json(['message' => 'Group edited successfully']);
        } else {
            return response()->json(['message' => 'You d\'ont have permission for edit this.'], 403);
        }
    }

    /**
     * @param Group $group
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function delete(Group $group, Request $request)
    {
        $this->can('user_manager', 'user_delete');
        if ((int)$request->id === (int)Crypt::decryptString($request->_check)) {
            $a = $group->find($request->id);
            if ($a && $a->delete()) {
                $a->_check = Crypt::encryptString($a->id);
                return response()->json(['message' => 'Group deleted successfully', 'group' => $a]);
            } else {
                return response()->json(['message' => 'Group not found or you d\'ont have permission for this action.'], 403);
            }
        } else {
            return response()->json(['message' => 'You d\'ont have permission for delete this.'], 403);
        }
    }

    /**
     * @param Group $group
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function restore(Group $group, Request $request)
    {
        $this->can('user_manager', 'user_edit');
        if ((int)$request->id === (int)Crypt::decryptString($request->_check)) {
            $a = $group->onlyTrashed()->find($request->id);
            if ($a && $a->restore()) {
                $a->_check = Crypt::encryptString($a->id);
                return response()->json(['message' => 'Group restored successfully', 'group' => $a]);
            } else {
                return response()->json(['message' => 'Group not found or you d\'ont have permission for this action.'], 403);
            }
        } else {
            return response()->json(['message' => 'You d\'ont have permission for restore this.'], 403);
        }
    }

    /**
     * create a new group
     * @param Group $group
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function create(Group $group, Request $request)
    {
        $this->can('user_manager', 'user_edit');
        $validator = Validator::make($request->all(), [
            'slug' => 'required|unique:groups|max:15',
            'desc' => 'required|max:55',
        ]);
        if ($validator->fails()) {
            return response()->json(['message' => $validator->errors()], 400);
        }
        if ($a = $group->create($request->all())) {
            return response()->json(['message' => 'Group created successfully', 'group' => $a]);
        } else {
            return response()->json(['message' => 'Unknown Error'], 403);
        }

    }

    /**
     * @param Request $request
     * @param UsersGroup $usersGroup
     * @return \Illuminate\Http\JsonResponse
     */
    public function editUsersOnGroups(Request $request, UsersGroup $usersGroup)
    {
        $this->can('user_manager', 'user_edit');
        $a = $usersGroup->where('group_id', $request->group)->get()->toArray();
        $b = $this->valueIds($a, 'user_id');
        $this->saveUserOnGroup(array_diff($request->users, $b), array_diff($b, $request->users), (int)$request->group);
        return response()->json(['message' => 'Group edited successfully']);
    }

    /**
     * @param array $add
     * @param array $remove
     * @param int $group
     */
    private function saveUserOnGroup(array $add, array $remove, int $group)
    {
        $this->can('user_manager', 'user_edit');
        foreach ($add as $value) {
            $a = UsersGroup::where('user_id', $value)->where('group_id', $group)->get()->toArray();
            if (count($a) === 0) {
                $b = new UsersGroup();
                $b->group_id = $group;
                $b->user_id = $value;
                $b->save();
            }
        }
        foreach ($remove as $value) {
            UsersGroup::where('user_id', $value)->where('group_id', $group)->delete();
        }
    }
}
