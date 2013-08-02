require 'spec_helper'

describe Photo do
    
  before(:each) do
    create_new_photo
    @photo = Photo.last
    @attr = { 
      :image => "#{Rails.root}/spec/support/images/example.jpg"
    }
  end
  
  it "has a valid factory" do
    @photo.should be_valid
  end
  
  it { should respond_to(:image) }
  
  describe "when the image is blank" do
    before { @photo.image = nil }
    it { should_not be_valid }
  end
  
  describe "when file is too big" do
    before { @photo.image.size > 2.5.megabytes }
    it { should_not be_valid }
  end

end