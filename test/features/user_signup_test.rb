require "test_helper"

class UserSignupTest < Capybara::Rails::TestCase
  test "navigate to /signup and see a registration form" do
    visit signup_path

    assert_content page, 'Crear una cuenta'
    assert_selector page, '#new_user'
  end
end
