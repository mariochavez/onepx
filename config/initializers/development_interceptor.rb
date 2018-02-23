# frozen_string_literal: true

if Rails.env.development?
  require Rails.application.root.join("lib/development_interceptor")

  ActionMailer::Base.register_interceptor(DevelopmentInterceptor)
end
