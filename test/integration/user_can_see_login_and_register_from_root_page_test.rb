require 'test_helper'

class UsersTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  test "user can see login and register links from root page" do

  visit users_path

  assert users_path, current_path

  assert page.has_content?("We find Developers")
save_and_open_page
  click_button "Login"
  click_button "Register"

  end
end
