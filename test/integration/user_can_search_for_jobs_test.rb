class UserCanSearchforJobTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:ali)
  end

  test "non registered or log in user can search for jobs" do
    visit root_path
    assert root_path, current_path
    click_link "Search Jobs"

    assert page.has_content?("Find Your Dream Job")
    assert page.has_link?("Fullstack development")
    assert page.has_link?("Hacker")
  end

    test "non registered or log in user can see specific job" do
      visit root_path
      assert root_path, current_path
      click_link "Search Jobs"

      assert page.has_content?("Find Your Dream Job")
      assert page.has_link?("Fullstack development")
      assert page.has_link?("Hacker")

      click_link "Hacker"

      assert page.has_content?("Spy")
      assert page.has_content?("Deparment: Business Intelligence")
    end

    test "user must be logged in to apply for job" do
      visit root_path
      assert root_path, current_path
      click_link "Search Jobs"


      assert page.has_content?("Find Your Dream Job")
      assert page.has_link?("Fullstack development")
      assert page.has_link?("Hacker")

      click_link "Hacker"
      click_link "Apply"

      assert login_path, current_path

    end

    test "regular user cannot create a job listing" do
      visit root_path

      click_link "Log In"

      assert login_path, current_path

      fill_in "Email", with: "example@yahoo.com"
      fill_in "Password", with: "password"

      click_on "Log In"

      assert login_path, current_path
      # assert page.has_content?("Invalid Email and/or Password")

    end

end
