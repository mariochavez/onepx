require 'test_helper'

class RegistrationControllerTest < ActionController::TestCase
  test 'GET /new' do
    get :new

    assert_response :success
  end
end
