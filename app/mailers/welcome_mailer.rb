# frozen_string_literal: true

class WelcomeMailer < ApplicationMailer
  def welcome_email(user)
    @user = user
    mail(to: @user.email, subject: I18n.t("welcome_mailer.welcome_email.subject"))
  end
end
