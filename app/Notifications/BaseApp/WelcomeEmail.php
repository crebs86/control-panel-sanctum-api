<?php

namespace App\Notifications\BaseApp;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Notifications\Messages\MailMessage;
use Illuminate\Notifications\Notification;

class WelcomeEmail extends Notification implements ShouldQueue
{
    use Queueable;

    private $user_name;

    /**
     * SystemNotification constructor.
     * Create a new notification instance.
     *
     * @param $name
     * @return void
     */
    public function __construct($name)
    {
        $this->user_name = $name;
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
            'mail',
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
            ->subject('Welcome to ' . env('APP_NAME'))
            ->line('Dear ' . $this->user_name . ',')
            ->line('Welcome to ' . env('APP_NAME') . '. Use the bellow button to access our application.')
            ->action('Go To ' . env('APP_NAME'), env('APP_URL'))
            ->line('Thank you for using our application!');
    }
}
