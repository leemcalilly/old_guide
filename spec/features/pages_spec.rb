require 'spec_helper'

describe "Pages" do
  
  describe "Home page" do
    
    it "renders the homepage" do
      visit root_path
      page.status_code.should be(200)
    end
    
    it "has the right content" do
      visit root_path
      page.should have_content("The Fuzz Guide to Guitar")
    end
    
  end
  
end
