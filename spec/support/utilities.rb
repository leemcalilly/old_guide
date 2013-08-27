require 'spec_helper'

def create_new_lesson
  signup_and_login_admin
  visit 'lessons/new'
  fill_in "Title", :with => "How to Play a G Chord"
  select "2013", :from => "lesson_date_1i"
  select "June", :from => "lesson_date_2i"
  select "1", :from => "lesson_date_3i"
  fill_in "Description", :with => "This is how you learn guitar."
  attach_file("lesson[featured_photo]", "#{Rails.root}/spec/support/images/example.jpg")
  select "Beginner", :from => "Level"
  select "Bluegrass", :from => "Genre"
  select "Fundamentals", :from => "Topic"
  fill_in "Article", :with => "This is where all the info is."
  fill_in "Video", :with => "76538"
  fill_in "Resources", :with => "Here are additional resources."
  select "Draft", :from => "Visibility"
  click_button "Create Lesson"
  page.should have_content("Lesson created!")
end

def create_new_photo
  signup_and_login_admin
  visit '/photos'
  attach_file("photo[image]", "#{Rails.root}/spec/support/images/example.jpg")
  click_button "Upload Photo"
  current_path == "/photos"
  page.should have_content("Photo created!")
end

def signup_and_login
  visit logout_path
  user = FactoryGirl.build(:user)
  visit '/signup'
  fill_in "Name", :with => user.name
  fill_in "Email", :with => user.email
  fill_in "Password", :with => user.password
  click_button "Create User"
  current_path.should == "/lessons"
  page.should have_content("Signed up!")
end

def signup_and_login_admin
  visit logout_path
  user = FactoryGirl.build(:user)
  visit '/signup'
  fill_in "Name", :with => user.name
  fill_in "Email", :with => user.email
  fill_in "Password", :with => user.password
  click_button "Create User"
  current_path.should == "/lessons"
  page.should have_content("Signed up!")
  admin = User.last
  admin.add_role :admin
  admin.has_role? :admin
end