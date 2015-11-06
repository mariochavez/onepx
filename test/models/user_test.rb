require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'valid user with valid attributes' do
    user = User.new.tap do |u|
      u.email = 'test@mail.com'
      u.password = 'pa$$word'
      u.password_confirmation = 'pa$$word'
    end

    assert_equal user.valid?, true
  end

  test 'invalid user with invalid attributes' do
    user = User.new

    refute_equal user.valid?, true

    refute_empty user.errors[:email]
    refute_empty user.errors[:password]
  end

  test 'invalid user with duplicated email' do
    user = User.new.tap do |u|
      u.email = 'user@mail.com'
      u.password = 'pa$$word'
      u.password_confirmation = 'pa$$word'
    end

    refute_equal user.valid?, true

    refute_empty user.errors[:email]
    assert_empty user.errors[:password]
  end

  test 'invalid user with short password' do
    user = User.new.tap do |u|
      u.email = 'test@mail.com'
      u.password = 'pa$$'
      u.password_confirmation = 'pa$$'
    end

    refute_equal user.valid?, true

    assert_empty user.errors[:email]
    refute_empty user.errors[:password]
  end
end
