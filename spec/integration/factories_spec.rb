require 'spec_helper'

describe "Factories" do
  
  describe "User" do
    it "has a valid user factory" do
      user = FactoryGirl.create(:user)
      user.should be_valid
    end

    it "signs up and logs in a factory girl user" do
      user = FactoryGirl.build(:user)
      visit signup_path
      fill_in "Name", :with => user.name
      fill_in "Email", :with => user.email
      fill_in "Password", :with => user.password
      click_button "Create User"
      current_path.should == "/lessons"
      page.should have_content("Signed up!")
      visit logout_path
      visit login_path
      fill_in "Email",    :with => user.email
      fill_in "Password", :with => user.password
      check "Remember me"
      click_button "Log in"
      page.should have_content("Logged in!")
    end

    it "the signup_and_login utility method works" do
      signup_and_login
      current_path.should == "/lessons"
      page.should have_content("Signed up!")
    end
  end
  
  describe "Admin" do
    it "has a valid admin factory" do
      user = FactoryGirl.create(:admin)
      user.should be_valid
    end
    
    it "adds an admin role" do
      user = FactoryGirl.build(:user)
      visit signup_path
      fill_in "Name", :with => user.name
      fill_in "Email", :with => user.email
      fill_in "Password", :with => user.password
      click_button "Create User"
      current_path.should == "/lessons"
      page.should have_content("Signed up!")
      admin = User.last
      admin.add_role :admin
      admin.has_role? :admin
    end
    
    it "the signup_and_login_admin utility method works" do
      signup_and_login_admin
      current_path.should == "/lessons"
      page.should have_content("Signed up!")
      admin = User.last
      admin.has_role? :admin
    end
  end
  
  describe "Lesson" do
    it "has a working create_new_lesson utility method" do
      create_new_lesson
      page.should have_content("Lesson created!")
    end
  end
  
  describe "Photo" do
    it "has a working create_new_photo utility method" do
      create_new_photo
      page.should have_content("Photo created!")
    end
  end
end