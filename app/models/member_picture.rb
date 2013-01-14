class MemberPicture < ActiveRecord::Base
  attr_accessible :create_year, :description, :member, :size, :technique, :file, :width, :height
  
  
  validates :create_year, presence: true
  validates :description, presence: true
  #validates :member, presence: true
  validates :size, presence: true
  validates :technique, presence: true

  mount_uploader :file, MemberPictureUploader
  
  belongs_to :member
end
