# encoding: utf-8

class ImageUploader < CarrierWave::Uploader::Base

  include CarrierWave::RMagick
  include CarrierWave::MimeTypes
  process :set_content_type
  
  storage :fog

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # Create different versions of your uploaded files:
  version :small do
    process :resize_to_fill => [220, 220]
  end
  
  version :medium do
    process :resize_to_fill => [440, 440]
  end
  
  version :large do
    process :resize_to_limit => [720, 2000]
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end

end
