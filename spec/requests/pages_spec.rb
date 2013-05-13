require 'spec_helper'

describe "Pages" do    
  
  describe "Home" do
    
    it "renders the home page" do
      visit root_path
      page.status_code.should be(200)
    end
    
    it "has the right content" do
      visit root_path
      page.should have_content("The Fuzz Guide to Guitar")
    end
    
    it "has the right title" do
      visit root_path
      page.should have_selector('title',
                          :text => "Home < The Fuzz Guide to Guitar")
    end
    
    it "has the right body class" do
      pending
    end
    
  end
  
  describe "About Us" do
  
    it "renders the about us page" do
      visit '/about'
      page.status_code.should be(200)
    end
    
    it "has the right content" do
      visit '/about'
      page.should have_content("About Us")
    end
    
    it "has the right title" do
      visit '/about'
      page.should have_selector('title',
                          :text => "About Us < The Fuzz Guide to Guitar")
    end
    
    it "has the right body class" do
      pending
    end
  end
  
  describe "How it works" do
  
    it "renders the how it works page" do
      visit '/how-it-works'
      page.status_code.should be(200)
    end
    
    it "has the right content" do
      visit '/how-it-works'
      page.should have_content("How It Works")
    end
    
    it "has the right title" do
      visit '/how-it-works'
      page.should have_selector('title',
                          :text => "How It Works < The Fuzz Guide to Guitar")
    end
    
    it "has the right body class" do
      pending
    end
    
  end
  
end
