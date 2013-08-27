require 'spec_helper'

describe Photo do
  
  before(:each) do
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
    visit '/photos'
    attach_file("photo[image]", "#{Rails.root}/spec/support/images/example.jpg")
    click_button "Upload Photo"
    current_path == "/photos"
    page.should have_content("Photo created!")
    @photo = Photo.last
  end
  
  it "creates a valid lesson" do
    @photo.should be_valid
  end
  
  it { should respond_to(:image) }
  
  describe "when the image is blank" do
    before { @photo.image = nil }
    it { should_not be_valid }
  end
  
  describe "when the image is too big" do
    before { @photo.image.size > 2.5.megabytes }
    it { should_not be_valid }
  end

end