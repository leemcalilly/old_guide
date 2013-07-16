require 'spec_helper'

describe "photos" do
  
  describe "Index" do
    
    describe "admin users" do
      before(:each) do
        create_new_photo
        visit '/photos'
        @photo = Photo.last
      end
      
      it "shows the right links to admin users on the index page" do  
        page.should have_link("Show")
        page.should have_link("Edit")
        page.should have_link("Destroy")
        page.should have_link("New Photo")
      end
      
      it "has the right title on the photos index page" do
        page.should have_title("Photos < The Fuzz Guide to Guitar")
      end
      
      it "has the right body class on the show photo page" do
        page.should have_css('body.photos')
      end

      it "has the right body id on the show photo page" do
        page.should have_css('body#index')
      end
      
      it "shows photos to admin users on the index page" do
        current_path.should == '/photos'
        page.should have_content("Photos")
        page.should have_content(@photo.image)
      end
      
      it "has the right content" do
        page.should have_content(@photo.image)
      end
    end # /admin
    
    describe "normal users" do     
      it "denies normal users access to photos" do
        signup_and_login
        visit '/photos'
        within("div.alert.alert-error") do
          page.should have_content("Whoops! You don't have permission to access this.")
        end
      end
    end # /normal
    
    describe "public users" do
      it "denies non-logged in users access to photos" do
        visit '/photos'
        within("div.alert.alert-error") do
          page.should have_content("First log in to view this page.")
        end
      end
    end # /public
  end # /Index
  
  describe "New" do
    describe "admin users" do
      before(:each) do
        signup_and_login_admin
        visit '/photos/new'
      end
      
      it "allows admin users to create new photos" do
        @new_photo = FactoryGirl.build(:photo)
        click_button "Create Photo"
        page.should have_content("Photo created!")
      end
      
      it "has the right title on the new photo page" do
        page.should have_title("New Photo < The Fuzz Guide to Guitar")
      end

      it "has the right body class on the new photo page" do
        page.should have_css('body.photos')
      end

      it "has the right body id on the new photo page" do
        page.should have_css('body#new')
      end
    end # /admin
    
    describe "normal users" do
      it "doesn't allow normal users to create photos" do
        signup_and_login
        visit '/photos/new'
        within('div.alert.alert-error') do
          page.should have_content("Whoops! You don't have permission to access this.")
        end
      end
    end # /normal
  
    describe "public users" do
      it "denies non-logged in users access to create photos" do
        visit '/photos/new'
        within("div.alert.alert-error") do
          page.should have_content("First log in to view this page.")
        end
      end
    end # /public
  end # /New
  
  describe "Show" do
    
    describe "admin users" do
      before(:each) do
        create_new_photo
        @photo = Photo.last    
        visit photo_path(@photo)
      end
      
      it "shows the right links to admin users on the show page" do
        page.should have_link("Edit")
        page.should have_link("Back")
      end
      
      it "allows you to navigate to the photo show page" do
        page.status_code.should be(200)
      end

      it "has the right title on the photo show page" do
        page.should have_title("View Photo < The Fuzz Guide to Guitar")
      end

      it "has the right body class on the show photo page" do
        page.should have_css('body.photos')
      end

      it "has the right body id on the show photo page" do
        page.should have_css('body#show')
      end
      
      it "has the right content" do
        page.should have_content(@photo.image)
      end
    end # /admin
    
    describe "normal users" do
      before(:each) do
        create_new_photo
        visit logout_path
        signup_and_login
        @photo = Photo.last
      end
      
      it "denies normal users access to view photos" do  
        visit photo_path(@photo)
        within("div.alert.alert-error") do
          page.should have_content("Whoops! You don't have permission to access this.")
        end
      end      
    end # /normal
    
    describe "public users" do
      it "denies non-logged in users access to view photos" do 
        create_new_photo
        visit logout_path
        @photo = Photo.last 
        visit photo_path(@photo)
        within("div.alert.alert-error") do
          page.should have_content("First log in to view this page.")
        end
      end
    end # /public
  end # /show
  
  describe "Edit" do
    describe "admin users" do
      before(:each) do
        signup_and_login_admin
        FactoryGirl.create(:photo)
        @photo = Photo.last
        visit '/photos'
        click_link "Edit"
      end
      
      it "allows admin users to edit photos" do
        pending
        page.should have_content("Edit Photo")
        click_button "Update Photo"
        page.should have_content("Photo updated!")
      end
      
      it "has the right title on the photos edit page" do
        page.should have_title("Edit Photo < The Fuzz Guide to Guitar")
      end

      it "has the right body class on the show photo page" do
        page.should have_css('body.photos')
      end

      it "has the right body id on the show photo page" do
        page.should have_css('body#edit')
      end
    end # /admin
    
    describe "normal users" do
      before(:each) do
        create_new_photo
        visit logout_path
      end
      
      it "doesn't allow normal users to edit photos" do
        signup_and_login
        @photo = Photo.last
        visit edit_photo_path(@photo)
        within('div.alert.alert-error') do
          page.should have_content("Whoops! You don't have permission to access this.")
        end
      end
      
      it "doesn't show normal users edit links" do
        visit '/photos'
        page.should_not have_link("Edit")
      end
    end # /normal
    
    describe "public users" do
      before(:each) do
        create_new_photo
        visit logout_path
      end
      
      it "denies non-logged in users access to edit photos" do
        @photo = Photo.last
        visit edit_photo_path(@photo)
        within("div.alert.alert-error") do
          page.should have_content("First log in to view this page.")
        end
      end
      
      it "doesn't show normal users edit links" do
        visit '/photos'
        page.should_not have_link("Edit")
      end
    end # /public
    
  end  # /Edit
  
  
  describe "Delete" do
    describe "admin users" do
      before(:each) do
        signup_and_login_admin
        FactoryGirl.create(:photo)
        @photo = Photo.last
        visit '/photos'
      end
         
      it "allows admin users to delete photos" do    
        expect { delete photo_path(@photo), {},
           'HTTP_COOKIE' =>
           "#{Capybara.current_session.driver.response.headers["Set-Cookie"]}" }.
            to change(Photo, :count).by(-1)
      end
    end
    
    describe "normal users" do
      before(:each) do
        signup_and_login
        FactoryGirl.create(:photo)
        @photo = Photo.last
        visit '/photos'
      end
      
      it "doesn't allow normal users to delete photos" do
        expect { delete photo_path(@photo), {},
           'HTTP_COOKIE' =>
           "#{Capybara.current_session.driver.response.headers["Set-Cookie"]}" }.
            to change(Photo, :count).by(0)
      end
      
      it "doesn't show normal users delete links" do
        page.should_not have_link("Destroy")
      end
    end
      
    describe "public users" do
      before(:each) do
        create_new_photo
        visit logout_path
        visit '/photos'
      end

      it "doesn't show delete links to public users" do
        page.should_not have_link("Destroy")
      end
    end # /Public
  end # /Delete

   
end # /photos