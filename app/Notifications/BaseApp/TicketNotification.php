<?php

namespace App\Notifications\BaseApp;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Notifications\Messages\BroadcastMessage;
use Illuminate\Notifications\Messages\MailMessage;
use Illuminate\Notifications\Notification;

class TicketNotification extends Notification implements ShouldQueue
{
    use Queueable;

    private $notification;

    /**
     * SystemNotification constructor.
     * Create a new notification instance.
     *
     * @param $notification
     * @param bool $new
     * @return void
     */
    public function __construct($notification, $new = false)
    {
        $a = new \stdClass();
        $a->id = $notification->id;
        if (strlen($notification->title) <= 50){
            $a->title = $new ? 'New Ticket: ' . $notification->title : $notification->title;
        }else{
            $a->title = substr($new ? 'New Ticket: ' . $notification->title : $notification->title, 0, 50) . '[...]';
        }
        $a->ticket_type_id = $notification->ticket_type_id;
        $a->content = strlen($notification->content) < 250 ? $notification->content : substr($notification->content, 0, 250) . '[...]';
        $this->notification = $a;
    }

    /**
     * Get the notification's delivery channels.
     *
     * @param mixed $notifiable
     * @return array
     */
    public function via($notifiable)
    {
        return [
            //'mail',
            'database',
            'broadcast',
        ];
    }

    /**
     * Get the mail representation of the notification.
     *
     * @param mixed $notifiable
     * @return MailMessage
     */
    public function toMail($notifiable)
    {
        return (new MailMessage)
            ->subject('Nova Notificação')
            ->line('Será criado uma lógica para verificação de envio de e-mail.')
            ->action('Notification Action', url('/'))
            ->line('Thank you for using our application!');
    }

    /**
     * @param $notifiable
     * @return array
     */
    public function toDatabase()
    {
        return [
            'notification' => $this->notification
        ];
    }

    /**
     * @return BroadcastMessage
     */
    public function toBroadcast()
    {
        return new BroadcastMessage([
            'data' => ['notification' => $this->notification]
        ]);
    }
}
