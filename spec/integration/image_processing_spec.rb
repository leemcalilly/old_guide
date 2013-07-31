require 'spec_helper'
require 'carrierwave/test/matchers'

describe "Image Uploader" do 
  before do
    path_to_file = "#{Rails.root}/spec/support/images/example.jpg"
    ImageUploader.enable_processing = true
    @uploader = ImageUploader.new(@photo)
    @uploader.store!(File.open(path_to_file))
  end
  
  after do
    ImageUploader.enable_processing = false
    @uploader.remove!
  end
   
  context 'the small version' do
    it "should scale down a small version of the image" do
      @uploader.small.should be_no_larger_than(220, 220)
    end
  end
  
  context 'the medium version' do
    it "should scale down a medium version of the image" do
      @uploader.medium.should be_no_larger_than(440, 440)
    end
  end
  
  context 'the large version' do
    it "should scale down a large version of the image" do
      @uploader.large.should be_no_larger_than(720, 2000)
    end
  end
end