# encoding: utf-8

class ImageUploader < CarrierWave::Uploader::Base
   include CarrierWave::RMagick

  # Choose what kind of storage to use for this uploader:
  # storage :fog

  if Rails.env.test?
    enable_processing = false
  end

  if Rails.env.production?
    storage :fog
  else
    storage :file
  end

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end


  version :thumb do
    process :resize_to_fit => [50, 50]
  end

  version :small do
    process :resize_to_limit => [200, 200]
  end

  version :medium do
    process :resize_to_fill => [400, 400]
  end

  # version :large do
  #   process :resize_to_fill => [600, 600]
  # end

  def extension_white_list
    %w(jpg jpeg gif png bmp)
  end

  def default_url
    # ActionController::Base.helpers.asset_path("fallback/" + [version_name, "default.png"].compact.join('_'))
    "http://upload.wikimedia.org/wikipedia/commons/2/22/Belton_House_2006_Giano.jpg"
  end

  # Provide a default URL as a default if there hasn't been a file uploaded:
  # def default_url
  #   # For Rails 3.1+ asset pipeline compatibility:
  #   # ActionController::Base.helpers.asset_path("fallback/" + [version_name, "default.png"].compact.join('_'))
  #
  #   "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  # end

  # Process files as they are uploaded:
  # process :scale => [200, 300]
  #
  # def scale(width, height)
  #   # do something
  # end

  # Create different versions of your uploaded files:
  # version :thumb do
  #   process :resize_to_fit => [50, 50]
  # end

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  # def extension_white_list
  #   %w(jpg jpeg gif png)
  # end

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  # def filename
  #   "something.jpg" if original_filename
  # end

end
