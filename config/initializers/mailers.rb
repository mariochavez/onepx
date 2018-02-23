# frozen_string_literal: true

Rails.application.config.base_email = "no-reply@onepx.co" unless Rails.application.config.respond_to?(:base_email)
