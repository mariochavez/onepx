# frozen_string_literal: true
require "test_helper"

class RegistrationControllerTest < ActionController::TestCase
  test "GET /new" do
    get :new

    assert_response :success
  end

  test "POST /create without params" do
    post :create, user: { email: "" }

    assert_response :success
  end

  test "POST /create with valid params" do
    post :create, user: { email: "newuser@mail.com",
                          password: "pa$$word",
                          password_confirmation: "pa$$word" }

    assert_redirected_to root_path
  end
end
