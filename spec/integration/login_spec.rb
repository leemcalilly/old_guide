require 'spec_helper'

describe "Login" do
  it "successfully routes to the login page" do
    visit login_path
    page.should have_content("Log in")
  end
    
  it "doesn't allow an invalid login" do
    visit login_path
    click_button "Log in"
    page.should have_content("invalid")
  end
  
  describe "the login process works as expected" do
    before(:each) do
      visit signup_path
      fill_in "Email", :with => "deedee@ramones.com"
      fill_in "Password", :with => "rockawaybeach"
      fill_in "Password confirmation", :with => "rockawaybeach"
      click_button "Create User"
      page.should have_content("Signed up!")
      visit logout_path
      visit login_path
      fill_in "Email", :with => "deedee@ramones.com"
      fill_in "Password", :with => "rockawaybeach"
      click_button "Log in"
    end
    
    it "logs in a user successfully" do
      within("div.alert.alert-success") do
        page.should have_content("Logged in!")
      end
    end
  
    it "allows logged-in users access to protected content" do
      current_path.should == "/lessons"
      page.should have_content("All Lessons")
    end
    
    it "allows users to logout" do
      visit logout_path
      within("div.alert.alert-success") do
        page.should have_content("Logged out!")
      end      
    end
  end
  
  it "doesn't show the login form if you are already logged in" do
    signup_and_login
    visit login_path
    page.should have_content("You're already logged in.")
    page.should have_link("lessons")
    page.should have_link("log out")
  end
end