require 'spec_helper'

describe "Lessons" do
  
  it "allows you to create new lessons" do
    @new_lesson = FactoryGirl.build(:lesson)
    visit new_lesson_path
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
  
  describe "viewing and editing lessons" do
    before(:each) do 
      @lesson = FactoryGirl.create(:lesson)
      visit lessons_path
    end
  
    it "shows lessons on the index page" do
        current_path == '/lessons'
        page.should have_content("Lessons")
        page.should have_content(@lesson.title)
    end
  
    it "allows you to navigate to the lesson show page" do
        click_link "Show"
        page.should have_content(@lesson.title)
    end
    
    it "allows you to edit lessons" do
        click_link "Edit"
        page.should have_content("Edit Lesson")
        fill_in "Title", :with => "Changing the Title"
        click_button "Update Lesson"
        page.should have_content("Lesson updated!")
    end
    
    it "allows you to delete lessons" do        
      expect { delete lesson_path(@lesson), {},
         'HTTP_COOKIE' =>
         "#{Capybara.current_session.driver.response.headers["Set-Cookie"]}" }.
          to change(Lesson, :count).by(-1)
    end
  end
end