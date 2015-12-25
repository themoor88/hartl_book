require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
  test 'invalid signup information' do
    get signup_path
    # The assert method here takes difference between user.count before and after the post request.
    # assert_equal is the exact same but assert_no_difference is more idiomatically correct.
    assert_no_difference 'User.count' do
      post users_path, user: {
        name: '',
        email: 'user@invalid',
        password: 'foo',
        password_confirmation: 'bar'
      }
    end
    assert_template 'users/new'
  end

  test 'valid signup information' do
    get signup_path
    # The assert method here takes difference between user.count before and after the post_request.
    assert_difference 'User.count', 1 do
      post_via_redirect users_path, user: {
        name: 'Example User',
        email: 'user@example.com',
        password: 'password',
        password_confirmation: 'password'
      }
    end
    assert_template 'users/show'
  end
end
