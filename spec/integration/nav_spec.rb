require 'spec_helper'

describe "Navbar" do
  
  describe 'Logged Out' do
    before(:each) do
      visit logout_path
      visit '/'
    end
    
    it "should have the right links in the main nav" do
      within('#main-nav') do
        page.should have_link('The Fuzz Guide')
      end
    end
    
    it "should have the right links in the utility nav" do
      within('#utility-nav') do
        page.should have_link('Sign Up')
        page.should have_link('Log In')
      end
    end
    
    it "has a working brand link" do
      click_link("The Fuzz Guide")
      current_path.should == "/"
      page.should have_content("A Better Way to Play")
    end
    
    it "has a working signup link" do
      within('#utility-nav') do
        click_link("Sign Up")
      end
      current_path.should == "/signup"
      page.should have_content("Sign Up")
    end
    
    it "has a working login link" do
      within('#utility-nav') do
        click_link("Log In")
      end
      current_path.should == "/login"
      page.should have_content("Log In")
    end
  end

  describe 'Logged In' do
    before(:each) do
      signup_and_login
    end
    
    it "should have the right links in the main nav" do
      within('#main-nav') do
        page.should have_link('The Fuzz Guide')
        page.should have_link('Lessons')
      end
    end
    
    it "should have the right links in the utility nav" do
      within('#utility-nav') do
        user = User.last
        page.should have_content("Welcome back, " + user.name)
        page.should have_link('Log Out')
      end
    end
    
    it "has a working brand link" do
      click_link("The Fuzz Guide")
      current_path.should == "/lessons"
      page.should have_content("All Lessons")
    end
    
    it "has a working lessons link" do
      click_link("Lessons")
      current_path.should == "/lessons"
      page.should have_content("All Lessons")
    end
    
    it "has a working welcome back link" do
      user = User.last
      click_link("Welcome back, " + user.name)
      current_path == '/lessons'
      page.should have_content("All Lessons")
    end
    
    it "has a working logout link" do
      click_link("Log Out")
      current_path.should == "/"
      within("div.alert.alert-success") do
        page.should have_content("Logged out!")
      end
    end
  end
  
end