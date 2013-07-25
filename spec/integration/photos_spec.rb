require 'spec_helper'

describe "photos" do
  describe "Index" do
    describe "admin" do
      it "has the right title" do
        create_new_photo
        visit '/photos'
        page.should have_title("Photos < The Fuzz Guide to Guitar")
      end
      
      it "has the right content" do
        create_new_photo
        visit '/photos'
        photo = Photo.last
        page.should have_content("Upload a Photo")
        page.should have_button("Upload Photo")
        page.should have_css(".image-preview")
        page.should have_css(".image-preview")
        page.should have_content("URL:")
        page.should have_content(photo.image_identifier)
        page.should have_link("View")
        page.should have_link("Delete")
      end
      
      it "has a working view photo link" do
        create_new_photo
        visit '/photos'
        click_link("View")
        page.should have_content("Photo Preview")
      end
      
      it "has a working delete photo link" do
        create_new_photo
        visit '/photos'
        expect { click_link "Delete" }.to change(Photo, :count).by(-1)
      end
      
      it "orders photos in reverse chronlogical order by created_at" do
        signup_and_login_admin
        visit '/photos'
        attach_file("photo[image]", "#{Rails.root}/spec/support/images/example_1.jpg")
        click_button "Upload Photo"
        current_path == "/photos"
        first_photo = Photo.last
        visit '/photos'
        attach_file("photo[image]", "#{Rails.root}/spec/support/images/example_2.jpg")
        click_button "Upload Photo"
        current_path == "/photos"
        second_photo = Photo.last
        visit '/photos'
        attach_file("photo[image]", "#{Rails.root}/spec/support/images/example_3.jpg")
        click_button "Upload Photo"
        current_path == "/photos"
        third_photo = Photo.last
        visit '/photos'
        within(".browse-photos > .row .image-preview:nth-child(1)") do
          page.should have_content(third_photo.image_identifier)
        end
        within(".browse-photos > .row .image-preview:nth-child(2)") do
          page.should have_content(second_photo.image_identifier)
        end
        within(".browse-photos > .row .image-preview:nth-child(3)") do
          page.should have_content(first_photo.image_identifier)
        end
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
      before(:each) do
        signup_and_login_admin
        visit '/photos'
      end
      
      it "allows admins to upload a photo" do
        attach_file("photo[image]", "#{Rails.root}/spec/support/images/example.jpg")
        click_button "Upload Photo"
        current_path == "/photos"
        page.should have_content("Photo created!")
      end
      
      it "doesn't use /photos/new for uploading" do
        pending
      end
      
      it "redirects you to the /photos page after upload" do
        pending
      end
      
      it "doesn't allow invalid file types" do
        attach_file("photo[image]", "#{Rails.root}/spec/support/images/example.tiff")
        click_button "Upload Photo"
        current_path == "/photos"
        page.should_not have_content("Photo created!")
        page.should have_content('You are not allowed to upload "tiff" files, allowed types: jpg, jpeg, gif, png')
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

