class Photo < ActiveRecord::Base
  validates_presence_of     :name
  
  mount_uploader :image, ImageUploader
end
