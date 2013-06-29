require 'spec_helper'

describe "Reset password" do
  let(:user) { FactoryGirl.create(:user) }
   
  describe "success" do
    it "has a password reset page" do
      visit '/password_resets/new'
      page.should have_content("Can't sign in? Forget your password?")
    end
  
    it "has a reset password link on the login page" do
      visit login_path
      page.should have_content("Forgot Password?")
      click_link("Forgot Password?")
      page.should have_content("Can't sign in? Forget your password?")
    end
  
    it "has a working password reset form" do
      visit '/password_resets/new'
      fill_in "Email", :with => user.email
      click_button "Reset my password!"
      current_path.should == "/"
      within("div.alert.alert-success") do
        page.should have_content("Instructions have been sent to your email.")
      end
    end
      
    it "emails the user when requesting password reset" do
      visit '/password_resets/new'
      fill_in "Email", :with => user.email
      click_button "Reset my password!"
      current_path.should == "/"
      within("div.alert.alert-success") do
        page.should have_content("Instructions have been sent to your email.")
      end
      last_email.to.should include(user.email)
    end
  end
  
  describe "failure" do
    it "lets the user know when their email is not signed up" do
      visit '/password_resets/new'
      fill_in "Email", :with => "foo@bar.com"
      click_button "Reset my password!"
      current_path.should == "/signup"
      within("div.alert.alert-error") do
        page.should have_content("Sorry, we don't have a user with that email address.")
      end     
    end
  end
end