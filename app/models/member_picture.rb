class MemberPicture < ActiveRecord::Base
  attr_accessible :create_year, :description, :member, :size, :technique
  
  belongs_to :member
end
