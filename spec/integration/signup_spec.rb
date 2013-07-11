require 'spec_helper'

describe "Sign up" do
  
  before(:each) do
    visit signup_path
  end
    
  describe "signup page" do
    it "should have a signup page" do
      page.should have_content("Sign Up")
    end
    
    it "doesn't show the signup form if you are already logged in" do
      signup_and_login
      visit signup_path
      page.should have_content("You've already signed up and logged in.")
      page.should have_link("lessons")
      page.should have_link("log out")
    end
  end
  
  describe "success" do
    it "signs up a new user and logs them in on signup" do
      fill_in "Email", :with => "deedee@ramones.com"
      fill_in "Password", :with => "rockawaybeach"
      click_button "Create User"
      page.should have_css("body.lessons")
      within("div.alert.alert-success") do
        page.should have_content("Signed up!")
      end
      page.should have_content("All Lessons")
    end
  end
  
  describe "failure" do
    it "doesn't make a new user when signup fields are blank" do
      visit signup_path
      fill_in "Email",        :with => ""
      fill_in "Password",     :with => ""
      click_button "Create User"
      current_path.should == "/users"
      within("div.error_messages") do
        page.should have_content("Form is invalid")
      end
    end    
  end
end