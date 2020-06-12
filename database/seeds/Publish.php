<?php

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class Publish extends Seeder
{
    public function run()
    {
        DB::table('users')->insert(array(
            [
                //user ID 1
                'name' => 'Super Administrator',
                'email' => 'super-admin@your.app',
                'password' => bcrypt('crebsacl'),
                'verified' => true,
                'active' => true,
                'only_worker' => false,
                'created_at' => now(),
                'updated_at' => now(),
            ]));/**/

        DB::table('profiles')->insert([
            'user_id' => 1,
            'branch_line' => '0000',
            'address' => 'Administration Sector',
            'sector' => 'TI',
            'full_name' => 'System Super Administrator'
        ]);/**/

        $permissions = array(

            /*
             * --------------------------------------------------------- *
             * --------------------------------------------------------- *
             *
             * Start general use
             *
             * --------------------------------------------------------- *
             * --------------------------------------------------------- *
             */
            ['name' => 'acl_manager', 'label' => 'Manager roles and permissions', 'created_at' => now(), 'updated_at' => now()],//1
            ['name' => 'acl_view', 'label' => 'View roles and permissions', 'created_at' => now(), 'updated_at' => now()],//2

            ['name' => 'user_view', 'label' => 'View users info', 'created_at' => now(), 'updated_at' => now()],//3
            ['name' => 'user_view_self', 'label' => 'View own info', 'created_at' => now(), 'updated_at' => now()],//4

            ['name' => 'user_create', 'label' => 'Create users', 'created_at' => now(), 'updated_at' => now()],//5

            ['name' => 'user_edit', 'label' => 'Edit users data', 'created_at' => now(), 'updated_at' => now()],//6
            ['name' => 'user_edit_self', 'label' => 'Edit own data', 'created_at' => now(), 'updated_at' => now()],//7

            ['name' => 'user_delete', 'label' => 'Delete a user', 'created_at' => now(), 'updated_at' => now()],//8
            ['name' => 'user_delete_self', 'label' => 'Delete own account', 'created_at' => now(), 'updated_at' => now()],//9

            ['name' => 'system_manager', 'label' => 'System Manager', 'created_at' => now(), 'updated_at' => now()],//10
            ['name' => 'user_manager', 'label' => 'User Manager', 'created_at' => now(), 'updated_at' => now()],//11
            /*
             * --------------------------------------------------------- *
             * --------------------------------------------------------- *
             *
             * End general use
             *
             * --------------------------------------------------------- *
             * --------------------------------------------------------- *
             */


            /*
             * --------------------------------------------------------- *
             * --------------------------------------------------------- *
             *
             * Begin posts based use
             *
             * --------------------------------------------------------- *
             * --------------------------------------------------------- *
             */

            ['name' => 'post_manager', 'label' => 'Manager the posts', 'created_at' => now(), 'updated_at' => now()],//12
            ['name' => 'post_view', 'label' => 'View the posts', 'created_at' => now(), 'updated_at' => now()],//13
            ['name' => 'post_edit', 'label' => 'Edit a post', 'created_at' => now(), 'updated_at' => now()],//14
            ['name' => 'post_create', 'label' => 'Create a post', 'created_at' => now(), 'updated_at' => now()],//15
            ['name' => 'post_delete', 'label' => 'Delete a post', 'created_at' => now(), 'updated_at' => now()],//16

            ['name' => 'post_view_self', 'label' => 'View own posts', 'created_at' => now(), 'updated_at' => now()],//17
            ['name' => 'post_edit_self', 'label' => 'Edit own posts', 'created_at' => now(), 'updated_at' => now()],//18
            ['name' => 'post_create_self', 'label' => 'Create a post', 'created_at' => now(), 'updated_at' => now()],//19
            ['name' => 'post_delete_self', 'label' => 'Delete own posts', 'created_at' => now(), 'updated_at' => now()],//20

            ['name' => 'ticket_manager', 'label' => 'Manager the Tickets', 'created_at' => now(), 'updated_at' => now()],//21
            ['name' => 'ticket_view', 'label' => 'View the Ticket', 'created_at' => now(), 'updated_at' => now()],//22
            ['name' => 'ticket_edit', 'label' => 'Edit a Ticket', 'created_at' => now(), 'updated_at' => now()],//23
            ['name' => 'ticket_create', 'label' => 'Create a Ticket', 'created_at' => now(), 'updated_at' => now()],//24
            ['name' => 'ticket_delete', 'label' => 'Delete a Ticket', 'created_at' => now(), 'updated_at' => now()],//25
            /*
             * --------------------------------------------------------- *
             * --------------------------------------------------------- *
             *
             * End posts based use
             *
             * --------------------------------------------------------- *
             * --------------------------------------------------------- *
             */

        );
        DB::table('permissions')->insert($permissions);

        $roles = array(

            /*
             * --------------------------------------------------------- *
             * --------------------------------------------------------- *
             *
             * Start general use
             *
             * --------------------------------------------------------- *
             * --------------------------------------------------------- *
             */
            ['name' => 'super-admin', 'label' => 'Full System Administrador', 'created_at' => now(), 'updated_at' => now()],//1
            ['name' => 'admin', 'label' => 'System Administrador', 'created_at' => now(), 'updated_at' => now()],//2


            /*
             * --------------------------------------------------------- *
             * --------------------------------------------------------- *
             *
             * End general use
             *
             * --------------------------------------------------------- *
             * --------------------------------------------------------- *
             */

            /*
             * --------------------------------------------------------- *
             * --------------------------------------------------------- *
             *
             * Begin posts based use
             *
             * --------------------------------------------------------- *
             * --------------------------------------------------------- *
             */

            ['name' => 'reviewer', 'label' => 'Edit, publish and manager posts', 'created_at' => now(), 'updated_at' => now()],//3
            ['name' => 'publisher', 'label' => 'Publish yourself posts', 'created_at' => now(), 'updated_at' => now()],//4
            ['name' => 'user', 'label' => 'Registered User', 'created_at' => now(), 'updated_at' => now()],//5
            /*
             * --------------------------------------------------------- *
             * --------------------------------------------------------- *
             *
             * Begin posts based use
             *
             * --------------------------------------------------------- *
             * --------------------------------------------------------- *
             */
        );
        DB::table('roles')->insert($roles);

        /*
  * --------------------------------------------------------- *
  * --------------------------------------------------------- *
  *
  * Start general use
  *
  * --------------------------------------------------------- *
  * --------------------------------------------------------- *
  */

        $permissionsRole = array(
            /**
             * admin user
             */
            ['permission_id' => '1', 'role_id' => '2'],//'admin'=>'acl_manager'
            ['permission_id' => '2', 'role_id' => '2'],//'admin'=>'acl_view'
            ['permission_id' => '10', 'role_id' => '2'],//'admin'=>'system_manager'
            ['permission_id' => '11', 'role_id' => '2'],//'admin'=>'user_manager'
            ['permission_id' => '21', 'role_id' => '2'],//'admin'=>'ticket_manager'

            ['permission_id' => '4', 'role_id' => '5'],//'user'=>'user_view_self'
            ['permission_id' => '7', 'role_id' => '5'],//'user'=>'user_edit_self'
            ['permission_id' => '9', 'role_id' => '5'],//'user'=>'user_delete_self'
            /**
             * general user
             */
            /*
             * --------------------------------------------------------- *
             * --------------------------------------------------------- *
             *
             * End general use
             *
             * --------------------------------------------------------- *
             * --------------------------------------------------------- *
             */

            /*
             * --------------------------------------------------------- *
             * --------------------------------------------------------- *
             *
             * Begin posts based use
             *
             * --------------------------------------------------------- *
             * --------------------------------------------------------- *
             */

            ['permission_id' => '12', 'role_id' => '3'],//'reviewer'=>'post_manager'

            ['permission_id' => '17', 'role_id' => '4'],//'publisher'=>'post_view_self'
            ['permission_id' => '18', 'role_id' => '4'],//'publisher'=>'post_edit_self'
            ['permission_id' => '19', 'role_id' => '4'],//'publisher'=>'post_create_self'
            ['permission_id' => '20', 'role_id' => '4'],//'publisher'=>'post_delete_self'


            /*
             * --------------------------------------------------------- *
             * --------------------------------------------------------- *
             *
             * Begin posts based use
             *
             * --------------------------------------------------------- *
             * --------------------------------------------------------- *
             */
        );
        DB::table('permission_role')->insert($permissionsRole);

        $role = array(
            ['user_id' => '1', 'role_id' => '1']
        );
        DB::table('role_user')->insert($role);

        $setting = array([
            'name' => 'default',
            'label' => 'Default Settings',
            'validate_mail' => true,
            'ac_account' => true,
            'protect_register_form' => true,
            'protect_register_form_admin' => true,
            'menu_show_users' => false,
            'active' => true
        ]);
        DB::table('settings')->insert($setting);/**/
    }
}
