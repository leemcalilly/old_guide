require 'spec_helper'

describe Photo do
    
  before(:each) do
    @photo = FactoryGirl.create(:photo)
  end
  
  it "has a valid factory" do
    @photo.should be_valid
  end
  
  it { should respond_to(:name) }
  
  describe "when the name is blank" do
    before { @photo.name = nil }
    it { should_not be_valid }
  end

end