<?php

namespace App\Http\Controllers\BaseApp;

use App\Http\Controllers\Controller;
use App\Http\Requests\BaseApp\MessagesRequest;
use App\Http\Traits\AclCore;
use App\Http\Traits\CryptTrait;
use App\Models\Conversation;
use App\Models\Message;
use App\Models\User;
use App\Notifications\BaseApp\MessengerNotification;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class NotificationController extends Controller
{
    use CryptTrait, AclCore;

    /**
     * NotificationController constructor.
     */
    public function __construct()
    {
        $this->middleware('auth:sanctum');
    }

    /**
     * @param User $user
     * @return \Illuminate\Http\JsonResponse
     */
    public function notifications(User $user)
    {
        return response()->json([
            'notifications' =>
                $user
                    ->where('id', auth('sanctum')->id())->first()
                    ->unreadNotifications()
                    ->where(function ($w) {
                        $w->where('type', 'App\Notifications\SystemNotification')
                            ->orWhere('type', 'App\Notifications\BaseApp\TicketNotification');
                    })
                    ->get()
        ]);
    }

    public function allNotifications(User $user)
    {
        return response()->json([
            'notifications' =>
                $user
                    ->where('id', auth('sanctum')->id())->first()
                    ->notifications()
                    ->where(function ($w) {
                        $w->where('type', 'App\Notifications\SystemNotification')
                            ->orWhere('type', 'App\Notifications\BaseApp\TicketNotification');
                    })
                    ->get()
        ]);
    }

    /**
     * @param User $user
     */
    public function markAsRead(User $user)
    {
        $notification = $user->where('id', auth('sanctum')->id())->first()
            ->notifications()
            ->where('id', \request('id'))
            ->first();
        if ($notification) $notification->markAsRead();
    }

    /**
     * @param User $user
     */
    public function markAllAsRead(User $user)
    {
        $user->where('id', auth('sanctum')->id())->first()
            ->unreadNotifications->markAsRead();
    }

    /**
     *
     */
    public function newSystemAlert()
    {
        //$this->notifications(new SystemNotification(''));
    }

    /**
     * @return \Illuminate\Http\JsonResponse
     */
    public function conversations()
    {
        return response()->json(
            DB::table('conversations')
                ->where('from', auth('sanctum')->id())
                ->orWhere('to', auth('sanctum')->id())
                ->orderBy('conversations.updated_at', 'desc')
                ->orderBy('conversations.id', 'asc')
                ->join('users', function ($join) {
                    $join->on('users.id', 'from')->where('users.id', '<>', auth('sanctum')->id())
                        ->orOn('users.id', 'to')->where('users.id', '<>', auth('sanctum')->id());
                })
                ->select('users.id as user_id', 'conversations.id', 'conversations.updated_at', 'users.name')
                ->simplePaginate(10)
        );
    }

    /**
     * @param Request $request
     * @return mixed
     */
    public function conversation(Request $request)
    {
        //$this->can('work_messenger');
        $m = Message::where('conversation', $request->id)
            ->where(function ($q) {
                $q->where('from', auth('sanctum')->id())
                    ->orWhere('to', auth('sanctum')->id());
            })
            ->join('users', function ($join) {
                $join->on('users.id', 'from')->where('users.id', '<>', auth('sanctum')->id())
                    ->orOn('users.id', 'to')->where('users.id', '<>', auth('sanctum')->id());
            })
            ->orderBy('messages.id', 'desc')
            ->simplePaginate(10);
        if ($m->count() > 0) {
            return $m;
        } else {
            $a = Conversation::where('id', $request->id)->first();
            if ($a) {
                return response()->json(['data' => [
                    array_merge($this->defineConversation(auth()->id() != $a->from ? $a->from : $a->to), ['conversation' => (int)$request->id, 'content' => '', 'created_at' => $a->updated_at])
                ]]);
            } else {
                return response()->json(['message' => 'No conversation founded!'], 403);
            }

        }
    }

    /**
     * @param $user
     * @return int[]
     */
    private function defineConversation($user)
    {
        return [
            'from' => (int)$user < (int)auth()->id() ? (int)$user : (int)auth()->id(),
            'to' => (int)$user > (int)auth()->id() ? (int)$user : (int)auth()->id()
        ];
    }

    /**
     * @param Message $message
     * @param MessagesRequest $request
     * @param Conversation $conversation
     * @return array
     */
    public function sendMessage(Message $message, MessagesRequest $request, Conversation $conversation)
    {
        if ($request->conversation !== null) {
            $a = $conversation
                ->where('conversations.id', $request->conversation)
                ->where(function ($q) {
                    $q->where('from', auth('sanctum')->id())
                        ->orWhere('to', auth('sanctum')->id());
                })
                ->join('users', function ($join) {
                    $join->on('users.id', 'from')->where('users.id', '<>', auth('sanctum')->id())
                        ->orOn('users.id', 'to')->where('users.id', '<>', auth('sanctum')->id());
                })
                ->select('users.name as user', 'conversations.id', 'conversations.from', 'conversations.to', 'conversations.updated_at')
                ->first();
            if ($a) {
                $message->conversation = (int)$request->conversation;
                $message->from = auth('sanctum')->id();
                $message->to = (int)$request->to;
                $message->content = $request->message;
                $message->created_at = date('Y-m-d H:i:s');
                $message->save();
                $a->updated_at = $message->created_at;
                $a->update();
                $return = [
                    'id' => $message->id,
                    'from' => $message->from,
                    'to' => $message->to,
                    //'user'=>$a->user,//avaliar uso
                    'conversation' => $message->conversation,
                    'created_at' => $message->created_at,
                    'content' => $message->content];
                $message->user->notify(new MessengerNotification($return));
                return $return;
            } else {

            }
        } else {
            //
        }
    }

    /**
     * @param Conversation $conversation
     * @return array
     */
    public function setNewConversation(Conversation $conversation)
    {
        $a = $conversation->where(function ($q) {
            $q->where('from', auth('sanctum')->id())
                ->orWhere('to', auth('sanctum')->id());
        })->where(function ($q) {
            $q->where('from', \request('id'))
                ->orWhere('to', \request('id'));
        })->first();
        if ($a && $a->count() === 1) {
            return $this->loadUserConversation($a->id, \request('id'));
        } else {
            $b = $this->defineConversation(\request('id'));
            $c = $conversation->create($b);
            return $this->loadUserConversation($c->id, \request('id'));
        }
    }

    /**
     * @param $id
     * @param $user_id
     * @return array|object
     */
    public function loadUserConversation($id, $user_id)
    {
        return DB::table('conversations')
            ->where('conversations.id', $id)
            ->join('users', function ($join) use ($user_id) {
                $join->on('users.id', 'from')->where('users.id', '=', $user_id)
                    ->orOn('users.id', 'to')->where('users.id', '=', $user_id);
            })
            ->select('users.id as user_id', 'conversations.id', 'conversations.updated_at', 'users.name')
            ->simplePaginate(10);
    }
}
