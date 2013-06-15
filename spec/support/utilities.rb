require 'spec_helper'

def create_new_lesson
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