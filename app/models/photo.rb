class Photo < ActiveRecord::Base  
  mount_uploader :image, ImageUploader
  
  validates_presence_of   :image
  validate :file_size
  
  def file_size
    if image.size > 2.5.megabytes
      errors.add(:image, "can't be larger than 2.5 MB")
    end
  end
  
end
