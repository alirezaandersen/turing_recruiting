# require 'test_helper'
#
# class UsersLoginTest < ActionDispatch::IntegrationTest
#
#
#   test "registered user can update their profile" do
#
#     visit edit_users_path(@user)
#
#     fill_in "First Name", with: "Ali"
#     fill_in "Last Name", with: "Andersen"
#     fill_in "Email", with: "alibon714@yahoo.com"
#     fill_in "Address", with: "Denver"
#     fill_in "Phone Number", with: "555-555-5555"
#     fill_in "Current Job", with: "Programmer"
#     fill_in "Previous Job", with: "Event Guru"
#
#     click_button "Update User"
#
#     within "div.updated_user" do
#       assert page.has_content?("Ali")
#       assert page.has_content?("Event Guru")
#     end
#   end
#
# end
