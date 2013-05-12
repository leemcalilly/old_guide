require 'spec_helper'

describe "Pages" do
  
  describe "Home page" do
    
    it "displays the homepage" do
      get root_path
      response.status.should be(200)
    end
    
    it "has the content" do
      get root_path
      page.should have_content("The Fuzz Guide to Guitar")
    end
    
  end
  
end
