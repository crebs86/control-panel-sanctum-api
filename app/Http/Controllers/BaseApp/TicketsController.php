<?php

namespace App\Http\Controllers\BaseApp;

use App\Http\Controllers\Controller;
use App\Http\Requests\BaseApp\TicketsRequest;
use App\Http\Traits\AclCore;
use App\Http\Traits\NotificationsCore;
use App\Models\Ticket;
use App\Models\TicketTypes;
use App\Models\User;
use Illuminate\Http\Request;

class TicketsController extends Controller
{
    use AclCore, NotificationsCore;

    /**
     * @param TicketTypes $types
     * @return \Illuminate\Http\JsonResponse
     */
    public function ticketTypes(TicketTypes $types)
    {
        return response()->json($types->all());
    }

    /**
     * Save a new ticket
     * @param TicketsRequest $request
     * @param Ticket $ticket
     * @return \Illuminate\Http\JsonResponse
     */
    public function newTicket(TicketsRequest $request, Ticket $ticket)
    {
        $this->setMessageError('You can\'t create a ticket!')->can('ticket_create', 'ticket_manager');
        $ticket->ticket_type_id = $request->department;
        $ticket->title = $request->subject;
        $ticket->content = $request->description;

        $ticket->user_id = auth('sanctum')->id();
        $ticket->save();
        $this->notificationNewTicket($ticket);
        return response()->json([
            'status' => 'success',
            'ticket' => $ticket->id
        ]);
    }

    /**
     * @param Ticket $tickets
     * @return \Illuminate\Http\JsonResponse
     */
    public function myTickets(Ticket $tickets)
    {
        return response()->json(
            [
                $tickets
                    ->where('user_id', auth('sanctum')->id())
                    ->select('id', 'title', 'content', 'closed_by', 'created_at', 'updated_at', \DB::raw('SUBSTRING(content, 1, 44) as content'))
                    ->orderBy('updated_at', 'desc')
                    ->get()
            ]
        );
    }

    /**
     * @param Ticket $tickets
     * @return \Illuminate\Http\JsonResponse
     */
    public function tickets(Ticket $tickets)
    {
        $this->can('ticket_view', 'ticket_manager');
        $a = User::select('id', 'name')->find(auth('sanctum')->id())->load('users_groups')->toArray();
        $b = [];
        $c = 0;
        if (count($a['users_groups'])) {
            foreach ($a['users_groups'] as $value) {
                if (count($value['groups']) > 0) {
                    foreach ($value['groups'] as $v) {
                        if (is_array($v)) {
                            $b[$c] = $v['group_id'];
                        }
                    }
                }
                $c++;
            }
        }
        return response()->json(
            [
                $tickets->where(function ($q) use ($b) {
                    if (count($b) > 1) {
                        foreach ($b as $v) {
                            $q->orWhere('ticket_type_id', $v);
                        }
                    } else {
                        $q->where('ticket_type_id', $b[0]);
                    }
                })
                    ->where('user_id', '<>', auth('sanctum')->id())
                    ->join('users', 'users.id', '=', 'tickets.user_id')
                    ->select('tickets.id', 'title', 'content', 'closed_by', 'assigned', 'priority', 'tickets.created_at', 'tickets.updated_at', 'users.name', \DB::raw('SUBSTRING(content, 1, 44) as content'))
                    ->orderBy('updated_at', 'desc')
                    ->get()
                    ->load('assigned_user')
            ]
        );
    }

    /**
     * @param Request $request
     * @param Ticket $ticket
     * @return \Illuminate\Http\JsonResponse
     */
    public function ticket(Request $request, Ticket $ticket)
    {
        $this->can('ticket_view', 'ticket_manager');
        $a = $ticket->where('id', $request->id)
            ->where('user_id', auth('sanctum')->id())
            ->with('user', 'department')
            ->get()->first();
        if ($a) {
            $a->dpt = $a->department->desc;
            $a->data = json_decode($a->data);
            return response()->json(
                $a
            );
        } else {
            return response()->json(
                'No data to show!', 403
            );
        }
    }

    /**
     * @param Request $request
     * @param Ticket $ticket
     * @return \Illuminate\Http\JsonResponse
     */
    public function ticketAdmin(Request $request, Ticket $ticket)
    {
        $this->can('ticket_view', 'ticket_manager', 'ticket_edit');
        $a = $ticket->where('id', $request->id)
            ->with('user', 'department')
            ->get()->first()->load('assigned_user');
        if ($a) {
            $a->dpt = $a->department->desc;
            $a->data = json_decode($a->data);
            return response()->json(
                $a
            );
        } else {
            return response()->json(
                'No data to show!', 403
            );
        }
    }

    /**
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function newMessageAdmin(Request $request)
    {
        return $this->newMessage($request, false, true);
    }

    /**
     * @param Request $request
     * @param bool $close
     * @param bool $administrationAction
     * @return \Illuminate\Http\JsonResponse
     */
    public function newMessage(Request $request, $close = false, $administrationAction = false)
    {
        $this->setMessageError('You can\'t create nothing here!')
            ->can('ticket_create', 'ticket_manager');
        $closeTicket = is_bool($close) && $close;
        if ($administrationAction) {
            $a = Ticket::where('id', $request->id)->select('id', 'closed_by', 'created_at', 'data', 'ticket_type_id')->first();
        } else {
            $a = Ticket::select('id', 'closed_by', 'created_at', 'data', 'ticket_type_id')
                ->where('id', $request->id)->where('user_id', auth('sanctum')->id())
                ->with('user')->get()->first();
        }
        if ($a->closed_by) {
            return response()->json(
                $closeTicket ? 'Ticket already closed' : 'Ticket closed. Request was denied. Open new ticket to continue', 403
            );
        } elseif ($a) {
            $b = json_decode($a->data);
            $b[] = [
                'date' => now()->format('Y-m-d H:i:s'),
                'name' =>
                    $closeTicket ? 'closed by #' . auth('sanctum')->id() . ' ' . auth('sanctum')->user()->name :
                        '#' . auth('sanctum')->id() . ' ' . auth('sanctum')->user()->name,
                'details' => $request->message
            ];
            $a->data = json_encode($b);
            $a->closed_by = $request->closed_by;
            $a->save();
            $a->data = json_decode($a->data);
            $a->dpt = $a->department->desc;
            return response()->json(
                [
                    'ticket' => $a,
                    'message' => $closeTicket ? 'Ticket was closed successfully' : 'Message added successfully'
                ]
            );
        } else {
            return response()->json(
                'Error during process. You don\'t have permission or ticket not found', 403
            );
        }
    }

    /**
     * @param Request $request
     * @param Ticket $ticket
     * @return \Illuminate\Http\JsonResponse
     */
    public function ticketAdminAccept(Request $request, Ticket $ticket)
    {
        $this->can('ticket_edit', 'ticket_manager');
        $t = $ticket->where('id', $request->id)->select('assigned', 'id', 'data')->first()->load('assigned_user');
        if ($t->assigned === null) {
            $t->assigned = auth('sanctum')->id();
            $t->data = $this->addData($t->data, 'Ticket Assigned');
            $t->save();
            return response()->json([
                'message' => 'Ticket assigned for ' . auth('sanctum')->user()->name,
                'assigned' => auth('sanctum')->user()->name
            ]);
        } else {
            return response()->json([
                'message' => 'This ticket already assigned to user ' . $t->assigned_user->name . ', you really would change this?'
            ], 201);
        }
    }

    /**
     * @param Request $request
     * @param Ticket $ticket
     * @return \Illuminate\Http\JsonResponse
     */
    public function ticketAdminAcceptConfirm(Request $request, Ticket $ticket)
    {
        $this->can('ticket_edit', 'ticket_manager');
        $t = $ticket->where('id', $request->id)->select('assigned', 'id', 'data')->first();
        $t->assigned = $request->assign ? $request->assign : auth('sanctum')->id();
        $t->data = $this->addData($t->data, 'Ticket Assigned');
        $t->save();
        return response()->json([
            'message' => 'Ticket assigned successfully',
            'assigned_user' => $t->load('assigned_user'),
        ]);
    }

    /**
     * @param Request $request
     * @param bool $administrationAction
     * @return \Illuminate\Http\JsonResponse
     */
    public function closeTicket(Request $request, $administrationAction = false)
    {
        $this->setMessageError('You can\'t close this ticket!')->can('ticket_create', 'ticket_manager');
        $request->message = $request->message ? $request->message : 'Closed';
        $request->closed_by = auth('sanctum')->id();
        return $this->newMessage($request, true, $administrationAction);
    }

    /**
     * @param TicketTypes $ticketTypes
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function departmentUsers(TicketTypes $ticketTypes, Request $request, User $user)
    {
        $a = $ticketTypes->find((int)$request->id)->load('tickets_groups')->toArray();
        $b = [];
        $c = [];
        if (count($a['tickets_groups']) > 0) {
            foreach ($a['tickets_groups'] as $value)
                if (count($value['groups']) > 0 && isset($value['groups']['users_group']) && count($value['groups']['users_group']) > 0) {
                    foreach ($value['groups']['users_group'] as $v) {
                        $b[] = $v['user_id'];
                    }
                }
        }
        if (count($b) > 0) {
            $c = $user->select('name', 'id')->find(array_unique($b));
        }
        return response()->json([
            'data' => $c
        ]);
    }

    public function setNewDepartment(Ticket $ticket, Request $request)
    {
        $this->can('ticket_edit', 'ticket_manager');
        $t = $ticket->select('id', 'ticket_type_id', 'data')->find($request->id);
        if ($t) {
            if ((int)$t->ticket_type_id !== (int)$request->department) {
                $t->ticket_type_id = $request->department;
                $t->data = $this->addData($t->data, 'Department changed');
                $t->save();
                return response()->json([
                    'department' => $t->load('department'),
                    'message' => 'Department set to ' . $t->department->desc
                ]);
            } else {
                return response()->json(['message' => 'This ticket already is on this department'], 403);
            }
        } else {
            return response()->json(['message' => 'Ticket not found'], 403);
        }
    }

    /**
     * @param Request $request
     * @param Ticket $ticket
     * @return \Illuminate\Http\JsonResponse
     */
    public function ticketSetPriority(Request $request, Ticket $ticket)
    {
        $this->can('ticket_edit', 'ticket_manager');
        $t = $ticket->select('id', 'priority', 'data')->find($request->ticket);
        if ($t && $t->count() > 0) {
            $t->priority = (int)$request->priority;
            $t->data = $this->addData($t->data, 'Priority defined to ' . $request->priority);
            $t->save();
            return response()->json(['message' => 'Priority changed successfully', 'data' => $t]);
        } else {
            return response()->json([
                'message' => 'Error during process. You don\'t have permission or ticket not found'
            ], 403);
        }
    }

    /**
     * @param $data
     * @param $details
     * @return false|string
     */
    private function addData($data, $details)
    {
        $tt = json_decode($data);
        $tt[] = [
            'date' => now()->format('Y-m-d H:i:s'),
            'name' => '#' . auth('sanctum')->id() . ' ' . auth('sanctum')->user()->name,
            'details' => $details
        ];
        return json_encode($tt);
    }
}
