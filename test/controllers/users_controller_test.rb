require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  include FactoryBot::Syntax::Methods
  include Devise::Test::IntegrationHelpers
  
  setup do
    @user = create(:user)
  end
  
  test "login should ask for username and password" do
    get new_user_session_path
    assert_response :success
    assert_select "input#user_username"
    assert_select "input#user_password"
  end
  
  test "show should force login" do
    get user_path @user.id
    assert_response :redirect
    assert_redirected_to new_user_session_path
  end
  
  test "show should list profile information" do
    sign_in @user
    get user_path @user.id
    assert_response :success
    assert_select "#profile_title", "#{@user.username}'s Profile"
    assert_select "#bio", @user.bio
    assert_select "#name", @user.name
    assert_select "#dob", @user.dob.strftime("%B %e, %Y")
    assert_select "#interests", @user.interests.map(&:name).join(", ")
    assert_select "#phone", @user.phone
    assert_select "#email", @user.email
  end
  
  test "index should force login" do
    get users_path
    assert_response :redirect
    assert_redirected_to new_user_session_path
  end
  
  test "index should list user info" do
    sign_in @user
    get users_path
    assert_response :success
    assert_select "#volunteers tbody tr", 1
    assert_select "#volunteers tbody tr" do
      assert_select "td", 3 
      assert_select "td:nth(1)", @user.username
      assert_select "td:nth(2)", @user.name
      assert_select "td:nth(3)", @user.created_at.strftime("%b %e, %Y")
    end
  end
end
