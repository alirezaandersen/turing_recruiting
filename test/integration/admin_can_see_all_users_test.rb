require 'test_helper'


  class AdminCanSeeAllUsersTest < ActionDispatch::IntegrationTest

    test "admin can see all users" do

      visit login_path

      fill_in "Email", with: users(:nate).email
      fill_in "Password", with: users(:nate).password
      # save_and_open_page
      click_link "Log In"

      assert user_path(users(:nate).id)


      visit admin_users_path

      assert admin_users_path, current_path

      users.each do |user|
      assert page.has_content?(user.first_name)
      end

      assert page.has_content?("Spooky")
      assert page.has_content?("Amy")
    end


  end
