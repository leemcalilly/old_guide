require 'spec_helper'

describe "Lessons" do
  
  describe "New lesson" do
    before(:each) do
      signup_and_login
      visit '/lessons/new'
    end
  
    it "allows you to create new lessons" do
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
  end
  
  describe "lessons index" do
    before(:each) do 
      signup_and_login
      FactoryGirl.create(:lesson)
      @lesson = Lesson.last
      visit '/lessons'
    end
  
    it "shows lessons on the index page" do
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
  end
  
  describe "showing lessons" do
    before(:each) do
      signup_and_login
      FactoryGirl.create(:lesson)
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
  end
  
  describe "editing lessons" do
    before(:each) do
      signup_and_login
      FactoryGirl.create(:lesson)
      @lesson = Lesson.last
      visit '/lessons'
      click_link "Edit"
    end
    
    it "allows you to edit lessons" do
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
  end
    
  describe "deleting lessons" do
    before(:each) do
      signup_and_login
      FactoryGirl.create(:lesson)
      @lesson = Lesson.last
      visit '/lessons'
    end
    
    it "allows you to delete lessons" do        
      expect { delete lesson_path(@lesson), {},
         'HTTP_COOKIE' =>
         "#{Capybara.current_session.driver.response.headers["Set-Cookie"]}" }.
          to change(Lesson, :count).by(-1)
    end
  end
end