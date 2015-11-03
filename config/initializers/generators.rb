Rails.application.config.generators do |g|
  g.test_framework :minitest, spec: false, fixture: true
end
