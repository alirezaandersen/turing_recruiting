

  test "Admin can create jobs" do

visit Admin logs in,

admin clicks on create Jobs

fill_in "Job Departement" with: "Technology Developer"
fill_in "Title", with: "Ruby Programmer"
fill_in "Description", with: "Funnest Job Ever"
fill_in "Requirements", with: "Must be Turing Graduate"
fill_in "Salary", with: "$70,000"

click_on "Create Jobs"

end
end
