require 'test_helper'


  class AdminCanSeeAllUsersTest < ActionDispatch::IntegrationTest

    test "admin can see all users" do

      visit login_path

      fill_in "Email" with: users(:nate).email
      fill_in "Email" with: users(:nate).password

      click_button "Log In"

      assert user_path(user(:nate).id)


      visit '/admin/users' admin_users_path

      assert admin_users_path, current_path

      users.each do |user|
      assert page.has_content?(user.first_name)  
      end

      assert page.has_content?("Spooky")
      assert page.has_content?("Amy")



    end


  end
