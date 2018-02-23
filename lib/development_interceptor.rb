# frozen_string_literal: true

class DevelopmentInterceptor
  def self.delivering_email(message)
    message.to = ["development@onepx.co"]
  end
end
