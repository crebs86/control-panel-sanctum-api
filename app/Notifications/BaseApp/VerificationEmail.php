<?php

namespace App\Notifications\BaseApp;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Notifications\Messages\MailMessage;
use Illuminate\Notifications\Notification;

class VerificationEmail extends Notification implements ShouldQueue
{
    use Queueable;

    private $notification;

    /**
     * SystemNotification constructor.
     * Create a new notification instance.
     *
     * @param $notification
     * @return void
     */
    public function __construct($notification)
    {
        $this->notification = $notification;
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
            ->subject('Email Address Verification')
            ->line('Dear ' . $this->notification->user . ',')
            ->line('Before you get started, please verify your email address below')
            ->action('Check Email Address', $this->notification->url)
            ->line('Thank you for using our application!');
    }
}
