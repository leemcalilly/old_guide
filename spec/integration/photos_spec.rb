require 'spec_helper'

describe "photos" do
  describe "Index" do
    describe "admin" do
      it "has the right title" do
        pending
      end
      
      it "has the right content" do
        pending
      end
      
      it "has working links" do
        pending
      end
    end
    
    describe "students" do      
      it "denies access to student users" do
        visit logout_path
        signup_and_login
        visit '/photos'
        page.should_not have_link("Upload a Photo")
        within('div.alert.alert-error') do
          page.should have_content("Whoops! You don't have permission to access this.")
        end
      end
    end
    
    describe "public" do
      it "denies access to public users" do
        visit logout_path
        visit '/photos'
        page.should_not have_link("Upload a Photo")
        within("div.alert.alert-error") do
          page.should have_content("First log in to view this page.")
        end
      end
    end
  end
  
  describe "Create" do
    describe "admin" do
      it "allows admins to upload a photo" do
        pending
      end
      
      it "doesn't use /photos/new for uploading" do
        pending
      end
      
      it "redirects you to the /photos page after upload" do
        pending
      end
      
      it "doesn't allow invalid file types" do
        pending
      end
      
      it "allows valid file types" do
        pending
      end
      
      it "shows uploaded photos on the index page" do
        pending
      end
      
      it "has the right links on the index page" do
        pending
      end
    end
    
    describe "students" do      
      it "denies access to student users" do
        visit logout_path
        signup_and_login
        visit '/photos'
        page.should_not have_link("Upload a Photo")
        within('div.alert.alert-error') do
          page.should have_content("Whoops! You don't have permission to access this.")
        end
      end
    end
    
    describe "public" do
      it "denies access to public users" do
        visit logout_path
        visit '/photos'
        page.should_not have_link("Upload a Photo")
        within("div.alert.alert-error") do
          page.should have_content("First log in to view this page.")
        end
      end
    end
  end
  
  describe "Show" do
    describe "admin" do      
      it "has the right title" do
        pending
      end
      
      it "has the right content" do
        pending
      end
      
      it "has working links" do
        pending
      end
    end
    
    describe "students" do
      it "denies access to student users" do
        pending
      end
    end
    
    describe "public" do
      it "denies access to public users" do
        pending
      end
    end
  end
end

