<?php


namespace App\Http\Traits;

use App\Models\TicketTypes;
use App\Models\User;
use App\Notifications\BaseApp\TicketNotification;
use Illuminate\Support\Facades\Notification;

/**
 * Trait NotificationsCore
 * @package App\Http\Traits
 */
trait NotificationsCore
{
    /**
     * Send a notification to users located on the department
     * @param $ticket
     */
    public function notificationNewTicket($ticket)
    {
        $t = TicketTypes::where('id', '=', $ticket->ticket_type_id)->select('id')->first()->load('tickets_groups')->toArray();
        if (count($t) > 0) {
            $u = [];
            if (is_array($t['tickets_groups'])) {
                foreach ($t['tickets_groups'] as $aa) {
                    if (is_array($aa['groups']['users_group'])) {
                        foreach ($aa['groups']['users_group'] as $v) {
                            if (is_int($v['user_id'])) {
                                $u[] = $v['user_id'];
                            }
                        }
                    }
                }
            }
            if (count($u)) {
                Notification::send(
                    User::select('id', 'email')->find($u),
                    new TicketNotification($ticket, true)
                );
            }
        }
    }
}
