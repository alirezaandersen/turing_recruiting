require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:ali)
    # byebug
  end

  test "login with invalid information " do
    get login_path
    assert_template 'sessions/new'
    post login_path, session: {user_name: "", password: ""}
    assert_template 'sessions/new'
    assert_not flash.empty?
    # save_and_open_page
    # byebug
    get root_path
    assert flash.empty?
  end

test "login with valid information " do
  get login_path
  # save_and_open_page
  post login_path, session: {email: @user.email, password: "password"}

  assert_redirected_to @user
  follow_redirect!

  assert_template 'users/show'
  #Look for <a href="/login"></a>
  #Make sure there are 0 on page
  assert_select "a[href=?]", login_path, count: 0

  assert_select "a[href=?]", logout_path
  assert_select "a[href=?]", user_path(@user)
  delete logout_path

  assert_not is_logged_in?
  assert_redirected_to root_url
  # byebug# save_and_open_page
  follow_redirect!

  # save_and_open_page
  assert_select "a[href=?]", login_path
  assert_select "a[href=?]", logout_path, count: 0
  # assert_select "a[href=?]", user_path(@user)
  end

  test "login with remembering" do
    log_in_as(@user, remember_me: '1')
    assert_not_nil cookies['remember_token']
  end

  test "login without remembering" do
    log_in_as(@user, remember_me: '0')
    assert_nil cookies['remember_token']
  end


end
