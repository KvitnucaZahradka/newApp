require 'test_helper'

class UsersEditTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:martin)
  end
  
  
  test "unsuccessful edit" do 
    log_in_as(@user)
    get edit_user_path(@user)
    assert_template 'users/edit'
    patch user_path(@user), user: { name: "", email: "foo@invalid", password: "foo", password_confirmation: "bar"} 
    assert_template 'users/edit'
  end

  ## !!!!! hartl had : patch user_path(@user), params:{user:{ name: .....}} But it did not work, so I changed 
  ## it to the patch user_path(@user), user: {name: ...}

 
  test "successful edit" do
     log_in_as(@user)
     get edit_user_path(@user)
     assert_template 'users/edit'
     name = "hunka"
     email = "hun@hun.com"
     patch user_path(@user),  user: { name: name, email: email, password: "", password_confirmation: ""}
     assert_not flash.empty?
     assert_redirected_to @user
     @user.reload
     assert_equal name, @user.name
     assert_equal email, @user.email
  end
  
  test "successful edit with friendly forwarding" do
    get edit_user_path(@user)
    log_in_as(@user)
    assert_redirected_to edit_user_path(@user)
    name = "Foo Bar"
    email = "foo@bar.com"
	    patch user_path(@user), user: {name: name, email: email, password: "", password_confirmation: "" } 
    assert_not flash.empty?
    assert_redirected_to @user
    @user.reload
    assert_equal name, @user.name
    assert_equal email, @user.email
  end
  
  # test "the truth" do
  #   assert true
  # end
end

