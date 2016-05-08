# frozen_string_literal: true
require "test_helper"

class HomeControllerTest < ActionController::TestCase
  test "GET /" do
    get :index

    assert_response :success
  end
end
