require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  def setup
   @user = users(:martin)
   @other_user = users(:lenjak)
  end

  test "should redirect index when not logged in" do
    get users_path
    assert_redirected_to login_url
  end

  test "should get new" do
    get signup_path
    assert_response :success
  end

  test "should redirect edit when not logged in" do
    #log_in_as(@user)
    get edit_user_path(@user)
    #post edit_user_path(@user), session:{email: @user.email, password: @user.password}
    assert_not flash.empty?
    assert_redirected_to login_url
  end

  test "should redirect update when not logged in" do
    #log_in_as(@user)
    #get edit_user_path(@user)
    #post login_path, session:{email: @user.email, password: @user.password}
    patch user_path(@user), user: {name: @user.name, email: @user.email}
    assert_not flash.empty?
    assert_redirected_to login_url
  end

  test "should not allow the admin attribute to be edited via the web" do
    log_in_as(@other_user)
    assert_not @other_user.admin?
    patch user_path(@other_user), user:{password: 'password',
                                        password_confirmation: 'password',
                                        admin: true}
    assert_not @other_user.admin?

  end

  test "should redirect edit when logged in as wrong user" do
    log_in_as(@other_user)
    get edit_user_path(@user)
    assert flash.empty?
    assert_redirected_to root_url
  end

  test "should redirect update when logged in as wrong user" do
    log_in_as(@other_user)
    patch user_path(@user), user: {name: @user.name, email: @user.email }
    assert flash.empty?
    assert_redirected_to root_url
  end

  test "should redirect destroy when not logged in" do
    assert_no_difference 'User.count' do
      delete user_path(@user)
    end
    assert_redirected_to login_url
  end

  test "should redirect destroy when logged in as a non-admin" do
    log_in_as(@other_user)
    assert_no_difference 'User.count' do
      delete user_path(@user)
    end
    assert_redirected_to root_url
  end

  ##originally hartl had: params: {user: {name: ....}}
  ## it somehow did not work, I changed it to: user: {name: ...}

end
