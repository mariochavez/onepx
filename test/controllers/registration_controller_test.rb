# frozen_string_literal: true

require "test_helper"

class RegistrationControllerTest < ActionController::TestCase
  test "GET /new" do
    get :new

    assert_response :success
  end

  test "POST /create without params" do
    assert_no_difference "ActionMailer::Base.deliveries.size" do
      post :create, params: { user: { email: "" } }
    end

    assert_response :success
  end

  test "POST /create with valid params" do
    assert_difference "ActionMailer::Base.deliveries.size", 1 do
      post :create, params: { user: { email: "newuser@mail.com",
                                      password: "pa$$word",
                                      password_confirmation: "pa$$word" } }
    end

    assert_redirected_to root_path
  end
end
