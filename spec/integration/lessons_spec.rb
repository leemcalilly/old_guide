require 'spec_helper'

describe "Lessons" do
  
  describe "Index" do
    
    describe "admin users" do
      it "shows the right links to admin users on the index page" do
        create_new_lesson
        visit '/lessons'
        page.should have_link("Show")
        page.should have_link("Edit")
        page.should have_link("Destroy")
        page.should have_link("New Lesson")
      end
    end # /admin
    
    describe "normal users" do
      before(:each) do 
        create_new_lesson
        visit logout_path
        signup_and_login
        @lesson = Lesson.last
        visit '/lessons'
      end
      
      it "shows lessons to all logged in users on the index page" do
        current_path.should == '/lessons'
        page.should have_content("Lessons")
        page.should have_content(@lesson.title)
      end
      
      it "has the right title on the lessons index page" do
        page.should have_title("Lessons < The Fuzz Guide to Guitar")
      end

      it "has the right body class on the show lesson page" do
        page.should have_css('body.lessons')
      end

      it "has the right body id on the show lesson page" do
        page.should have_css('body#index')
      end
      
      it "shows the right links to normal users on the index page" do
        page.should have_link("Show")
        page.should_not have_link("Edit")
        page.should_not have_link("Destroy")
        page.should_not have_link("New Lesson")
      end
    end # /normal
    
    describe "public users" do
      it "denies non-logged in users access to lessons" do
        visit '/lessons'
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
        visit '/lessons/new'
      end
      
      it "allows admin users to create new lessons" do
        @new_lesson = FactoryGirl.build(:lesson)
        fill_in "Title", :with => "How to Play a G Chord"
        select "2013", :from => "lesson_date_1i"
        select "June", :from => "lesson_date_2i"
        select "1", :from => "lesson_date_3i"
        fill_in "Description", :with => @new_lesson.description
        fill_in "Featured photo", :with => @new_lesson.featured_photo
        fill_in "Level", :with => @new_lesson.level
        fill_in "Genre", :with => @new_lesson.genre
        fill_in "Topic", :with => @new_lesson.topic
        fill_in "Article", :with => @new_lesson.article
        fill_in "Video", :with => @new_lesson.video
        fill_in "Resources", :with => @new_lesson.resources
        fill_in "Visibility", :with => @new_lesson.visibility
        click_button "Create Lesson"
        page.should have_content("Lesson created!")
      end
      
      it "has the right title on the new lesson page" do
        page.should have_title("New Lesson < The Fuzz Guide to Guitar")
      end

      it "has the right body class on the new lesson page" do
        page.should have_css('body.lessons')
      end

      it "has the right body id on the new lesson page" do
        page.should have_css('body#new')
      end
    end # /admin
    
    describe "normal users" do
      it "doesn't allow normal users to create lessons" do
        signup_and_login
        visit '/lessons/new'
        within('div.alert.alert-error') do
          page.should have_content("Whoops! You don't have permission to access this.")
        end
      end
    end # /normal
  
    describe "public users" do
      it "denies non-logged in users access to create lessons" do
        visit '/lessons/new'
        within("div.alert.alert-error") do
          page.should have_content("First log in to view this page.")
        end
      end
    end # /public
    
  end # /New
  
  describe "Show" do
    
    describe "admin users" do
      it "shows the right links to admin users on the show page" do
        create_new_lesson
        @lesson = Lesson.last    
        visit lesson_path(@lesson)
        page.should have_link("Edit")
        page.should have_link("Back")
      end
    end # /admin
    
    describe "normal users" do
      before(:each) do
        create_new_lesson
        visit logout_path
        signup_and_login
        @lesson = Lesson.last
        visit '/lessons'
        click_link "Show"
      end
      
      it "allows you to navigate to the lesson show page" do
        page.status_code.should be(200)
      end

      it "has the right title on the lesson show page" do
        page.should have_title("#{@lesson.title}" + " < The Fuzz Guide to Guitar")
      end

      it "has the right body class on the show lesson page" do
        page.should have_css('body.lessons')
      end

      it "has the right body id on the show lesson page" do
        page.should have_css('body#show')
      end
      
      it "shows the right links to normal users on the show page" do 
        visit lesson_path(@lesson)
        page.should_not have_link("Edit")
        page.should_not have_link("Back")
      end
    end # /normal
    
    describe "public users" do
      it "denies non-logged in users access to view lessons" do  
        visit lesson_path(@lesson)
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
        FactoryGirl.create(:lesson)
        @lesson = Lesson.last
        visit '/lessons'
        click_link "Edit"
      end
      
      it "allows admin users to edit lessons" do
        page.should have_content("Edit Lesson")
        fill_in "Title", :with => "Changing the Title"
        click_button "Update Lesson"
        page.should have_content("Lesson updated!")
      end
      
      it "has the right title on the lessons edit page" do
        page.should have_title("Edit Lesson < The Fuzz Guide to Guitar")
      end

      it "has the right body class on the show lesson page" do
        page.should have_css('body.lessons')
      end

      it "has the right body id on the show lesson page" do
        page.should have_css('body#edit')
      end
    end # /admin
    
    describe "normal users" do
      before(:each) do
        create_new_lesson
        visit logout_path
      end
      
      it "doesn't allow normal users to edit lessons" do
        signup_and_login
        @lesson = Lesson.last
        visit edit_lesson_path(@lesson)
        current_path.should == '/lessons'
        within('div.alert.alert-error') do
          page.should have_content("Whoops! You don't have permission to access this.")
        end
      end
      
      it "doesn't show normal users edit links" do
        visit '/lessons'
        page.should_not have_link("Edit")
      end
    end # /normal
    
    describe "public users" do
      before(:each) do
        create_new_lesson
        visit logout_path
      end
      
      it "denies non-logged in users access to edit lessons" do
        @lesson = Lesson.last
        visit edit_lesson_path(@lesson)
        within("div.alert.alert-error") do
          page.should have_content("First log in to view this page.")
        end
      end
      
      it "doesn't show normal users edit links" do
        visit '/lessons'
        page.should_not have_link("Edit")
      end
    end # /public
    
  end  # /Edit
  
  
  describe "Delete" do
    describe "admin users" do
      before(:each) do
        signup_and_login_admin
        FactoryGirl.create(:lesson)
        @lesson = Lesson.last
        visit '/lessons'
      end
         
      it "allows admin users to delete lessons" do    
        expect { delete lesson_path(@lesson), {},
           'HTTP_COOKIE' =>
           "#{Capybara.current_session.driver.response.headers["Set-Cookie"]}" }.
            to change(Lesson, :count).by(-1)
      end
    end
    
    describe "normal users" do
      before(:each) do
        signup_and_login
        FactoryGirl.create(:lesson)
        @lesson = Lesson.last
        visit '/lessons'
      end
      
      it "doesn't allow normal users to delete lessons" do
        expect { delete lesson_path(@lesson), {},
           'HTTP_COOKIE' =>
           "#{Capybara.current_session.driver.response.headers["Set-Cookie"]}" }.
            to change(Lesson, :count).by(0)
      end
      
      it "doesn't show normal users delete links" do
        page.should_not have_link("Destroy")
      end
    end
      
    describe "public users" do
      before(:each) do
        create_new_lesson
        visit logout_path
        visit '/lessons'
      end

      it "doesn't show delete links to public users" do
        page.should_not have_link("Destroy")
      end
    end # /Public
    
  end # /Delete

   
end # /Lessons