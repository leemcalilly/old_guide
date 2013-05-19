require 'spec_helper'

describe Lesson do
    
  before(:each) do
    @lesson = FactoryGirl.create(:lesson)
  end
  
  it "has a valid factory" do
    @lesson.should be_valid
  end
  
  it { should respond_to(:title) }
  it { should respond_to(:date) }
  it { should respond_to(:description) }
  it { should respond_to(:featured_photo) }
  it { should respond_to(:level) }
  it { should respond_to(:genre) }
  it { should respond_to(:topic) }
  it { should respond_to(:article) }
  it { should respond_to(:video) }
  it { should respond_to(:resources) }
  it { should respond_to(:visibility) }
  
  describe "when the title is blank" do
    before { @lesson.title = nil }
    it { should_not be_valid }
  end
  
  describe "when title is too short" do
    before { @lesson.title = "a" * 2 }
    it { should_not be_valid }
  end
  
  describe "when title is too long" do
    before { @lesson.title = "a" * 241 }
    it { should_not be_valid }
  end
  
  it "should reject duplicate title" do
    @attr = { :title => "Example Lesson" }
    Lesson.create!(@attr)
    duplicate_lesson = Lesson.new(@attr)
    duplicate_lesson.should_not be_valid
  end
end
