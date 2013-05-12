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
    
  end
  
  describe "About Us" do
  
    it "renders the about us page" do
      visit about_path
      page.status_code.should be(200)
    end
    
    it "has the right content" do
      visit about_path
      page.should have_content("About Us")
    end
  
  end
  
end
