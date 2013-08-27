require 'spec_helper'

describe Lesson do
    
  before(:each) do
    @attr = { 
        :title => "How to Play Guitar",
        :date => "December 25, 2012",
        :description => "This is a guitar lesson.",
        :featured_photo => "/spec/support/images/example.jpg",
        :level => "Beginner",
        :genre => "Bluegrass",
        :topic => "Fundamentals",
        :article => "This article contains everything you need to know.",
        :video => "67350589",
        :resources => "Here are some additional resources",
        :visibility => "Draft"
      }
      
      @lesson = Lesson.create!(@attr)
    end
  
  it "creates a valid lesson" do
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
  
  describe "when featured photo is too big" do
    before { @lesson.featured_photo.size > 2.5.megabytes }
    it { should_not be_valid }
  end
end
