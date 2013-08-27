class Lesson < ActiveRecord::Base
  mount_uploader :featured_photo, ImageUploader
  
  validates_presence_of     :title
  validates_uniqueness_of   :title
  validates_length_of       :title, :within => 5..240  
  validate                  :file_size
  
  def file_size
    if featured_photo.size > 2.5.megabytes
      errors.add(:featured_photo, "can't be larger than 2.5 MB")
    end
  end
end
