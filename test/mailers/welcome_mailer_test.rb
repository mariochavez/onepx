# frozen_string_literal: true

require "test_helper"

class WelcomeMailerTest < ActionMailer::TestCase
  test "welcome email" do
    user = users(:user)
    email = WelcomeMailer.welcome_email(user)

    assert_emails 1 do
      email.deliver_now
    end

    assert_equal [user.email], email.to
    assert_equal [Rails.application.config.base_email], email.from
    assert_equal I18n.t("welcome_mailer.welcome_email.subject"), email.subject
    assert_match(/Hola/, email.body.parts.first.to_s)
    assert_match(/Hola/, email.body.parts.last.to_s)
  end
end
