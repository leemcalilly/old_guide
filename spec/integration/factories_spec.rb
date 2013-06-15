require 'spec_helper'

describe "Factories" do
  
  it "has a valid lessons factory" do
    lesson = FactoryGirl.create(:lesson)
    lesson.should be_valid
  end
  
  it "has a working create_new_lesson utility method" do
    create_new_lesson
    page.should have_content("Lesson created!")
  end
end