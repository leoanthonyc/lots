require "test_helper"

class UserTest < ActiveSupport::TestCase
  test 'user does not save if it has no username' do
    user = User.new(password: 'password')
    assert_not user.save
  end

  test 'user does not save if it has no password' do
    user = User.new(username: 'username')
    assert_not user.save
  end

  test 'user does save if it has username and password' do
    user = User.new(username: 'username', password: 'password')
    assert user.save
  end
end
