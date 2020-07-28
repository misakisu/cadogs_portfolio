class NotificationMailer < ApplicationMailer
  default from: "cadogs@example.com"

  def reservation_thanks_mail(reservation)
    @reservation = reservation
    mail(
      subject: "ご予約ありがとうございます。", #メールのタイトル
      to: @reservation.user.email #宛先
    ) do |format|
      format.text
    end
  end
end