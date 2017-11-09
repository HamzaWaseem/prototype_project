class NotificationMailer < ApplicationMailer
  default from: 'prototype-project.herokuapp.com'

  def welcome(admin,recipient)
    @recipient = recipient
    mail(to: admin,
         subject: "[Signed up] Welcome #{recipient}")
  end
end
