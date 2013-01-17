# encoding: utf-8

class MemberPictureUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  permissions 0777

  # Include the Sprockets helpers for Rails 3.1+ asset pipeline compatibility:
  # include Sprockets::Helpers::RailsHelper
  # include Sprockets::Helpers::IsolatedHelper

  # storage :file
  storage :fog
  
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # Provide a default URL as a default if there hasn't been a file uploaded:
  # def default_url
  #   # For Rails 3.1+ asset pipeline compatibility:
  #   # asset_path("fallback/" + [version_name, "default.png"].compact.join('_'))
  #
  #   "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  # end

  # Create different versions of your uploaded files:
  # version :thumb do
  #   process :scale => [50, 50]
  # end
  
  def self.get_random_gallery_type(orientation)
    MemberPicture.gallery_types[orientation].sample
  end
  
  def self.get_random_main_page_type(orientation)
    MemberPicture.main_page_types[orientation].sample
  end
  
  
  version :main_page do
    process :prepare_to_main_page
  end
  
  def prepare_to_main_page
    orientation = model.get_orientation
    type = MemberPictureUploader.get_random_main_page_type orientation
    model.main_page_type = type[:id]
    model.main_page_width = type[:width]
    model.main_page_height = type[:height]
    resize_to_fill type[:width], type[:height]
  end
  
  version :gallery do
    process :prepare_to_gallery
  end
  
  def prepare_to_gallery
    orientation = model.get_orientation
    type = MemberPictureUploader.get_random_gallery_type orientation
    model.gallery_type = type[:id]
    model.gallery_width = type[:width]
    model.gallery_height = type[:height]
    resize_to_fill type[:width], type[:height]
  end

  def extension_white_list
    %w(jpg jpeg png)
  end
end
