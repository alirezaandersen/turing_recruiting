require 'test_helper'

class UsersTest < ActionDispatch::IntegrationTest

  test "user can see login and register links from root page" do

  visit users_path

  assert users_path, current_path

  assert page.has_content?("We Find Developers")

  assert page.has_link?("Login")
  assert page.has_link?("Register")

  end

  test "user can register" do

  visit users_path
  assert users_path, current_path

  click_on "Register"

  assert new_user_path, current_path

  fill_in "First Name", with: "Ali"
  fill_in "Last Name", with: "Andersen"
  fill_in "Email", with: "alibon714@yahoo.com"
  fill_in "Username", with: "Alireza"
  fill_in "Password", with: "password"

  click_button "Register"
  save_and_open_page
  assert page.has_content?("Welcome Ali")
end


end
