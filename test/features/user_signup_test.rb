# encoding: utf-8
# frozen_string_literal: true
require "test_helper"

class UserSignupTest < Capybara::Rails::TestCase
  test "navigate to /signup and see a registration form" do
    visit signup_path

    assert_content page, "Únete a onepx Correo electrónico Contraseña Confirmar contraseña"
    assert_selector page, '#new_user'
  end

  test "fill in form at /signup and see welcome message" do
    visit signup_path

    within('#new_user') do
      fill_in "Correo electrónico", with: "newuser@mail.com"
      fill_in "Contraseña", with: "password"
      fill_in "Confirmar contraseña", with: "password"

      click_button "Unirse"
    end

    assert_content "Bienvenido newuser@mail.com"
  end

  test "dont fill in form at /signup, click button and see form errors" do
    visit signup_path

    within('#new_user') do
      click_button "Unirse"
    end

    assert_content "Por favor corrija los siguientes errores"
    assert_equal all(".error-field").count, 2
    refute_content "Bienvenido"
  end
end
