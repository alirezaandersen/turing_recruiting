require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest

  def set_up
    @user = users(:ali)
  end

  test "registered user can update their profile" do

    visit new_user_path
    assert new_user_path, current_path

    fill_in "First Name", with: "Ali"
    fill_in "Last Name", with: "Andersen"
    fill_in "Email", with: "example1@yahoo.com"
    fill_in "Password", with: "password"

    click_button "Register"
    save_and_open_page
    assert page.has_content?("Welcome Ali")

    visit edit_user_path(@user)
    assert edit_user_path(@user), current_path

    fill_in "First Name", with: "Ali"
    fill_in "Last Name", with: "Andersen"
    fill_in "Email", with: "aladf@yahoo.com"
    fill_in "Address", with: "Denver"
    fill_in "Phone number", with: "555-555-5555"
    fill_in "Current job", with: "Programmer"
    fill_in "Previous job", with: "Ruby Developer"

    click_button "Update Profile"

    assert page.has_content?("Profile updated")
  end

end
