require 'spec_helper'

describe "Public" do    
  
  describe "Home" do
    
    it "renders the home page" do
      visit '/'
      page.status_code.should be(200)
    end
    
    it "has the right content" do
      visit '/'
      page.should have_content("A Better Guitar Method")
    end
    
    it "has the right title" do
      visit '/'
      page.should have_title("Home < The Fuzz Guide to Guitar")
    end
    
    it "has the right body class" do
      visit '/'
      page.should have_css('body.public')
    end

    it "has the right body id" do
      visit '/'
      page.should have_css('body#home')
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
      page.should have_title("About Us < The Fuzz Guide to Guitar")
    end

    it "has the right body class" do
      visit '/about'
      page.should have_css('body.public')
    end

    it "has the right body id" do
      visit '/about'
      page.should have_css('body#about')
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
      page.should have_title("How It Works < The Fuzz Guide to Guitar")
    end
    
    it "has the right body class" do
      visit '/how-it-works'
      page.should have_css('body.public')
    end
    
    it "has the right body id" do
      visit '/how-it-works'
      page.should have_css('body#how_it_works')
    end    
  end
end
