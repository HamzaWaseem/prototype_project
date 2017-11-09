class NotificationMailer < ApplicationMailer
  default from: 'system@loudthinking.com'

  def welcome(admin,recipient)
    @recipient = recipient
    mail(to: admin,
         subject: "[Signed up] Welcome #{recipient}")
  end
end
