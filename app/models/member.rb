class Member < ActiveRecord::Base
  attr_accessible :bid_state, :birth_year, :city, :competition_state, :country, :email, :first_name, :last_name, :phone, :pictures

  belongs_to :bid_state
  belongs_to :competition_state
  
  has_many :pictures, class_name: "MemberPicture"
  
  accepts_nested_attributes_for :pictures
end
