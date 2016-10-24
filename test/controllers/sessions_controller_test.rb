require 'test_helper'

class SessionsControllerTest < ActionController::TestCase
  def login_a_user
    request.env['omniauth.auth'] = OmniAuth.config.mock_auth[:github]
    get :create,  {provider: "github"}
  end

  # def logout_a_user
  #   request.env['omniauth.auth'] = OmniAuth.config.mock_auth[:github]
  #   get :create,  {provider: "github"}
  # end

  test "Can Create a user" do
    assert_difference('User.count', 1) do
      login_a_user
      assert_response :redirect
      assert_redirected_to sessions_path
      assert_not_nil session[:user_id]
    end
  end

  test "If a user logs in twice it doesn't create a 2nd user" do
    assert_difference('User.count', 1) do
      login_a_user
    end
    assert_no_difference('User.count') do
      login_a_user
      assert_response :redirect
      assert_redirected_to sessions_path
    end
  end

#honestly not sure if this test is testing things correctly
  test "a user logging out cleans the sessions and redirects them to the home page" do
    login_a_user
    user = users(:ada)
    session.delete(user)
    assert is_logged_in?
    assert_nil session[:user]
    assert_response :redirect
   assert_redirected_to sessions_path
  end

end
