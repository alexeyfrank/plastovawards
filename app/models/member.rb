class Member < ActiveRecord::Base
  attr_accessible :bid_state, :birth_year, :city, :competition_state, :country, :email, :first_name, :last_name, :phone, :pictures_attributes

  validates :birth_year, presence: true
  validates :city, presence: true
  validates :country, presence: true
  validates :email, presence: true, email: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :phone, presence: true

  belongs_to :bid_state
  belongs_to :competition_state

  has_many :pictures, class_name: "MemberPicture", dependent: :destroy
  
  accepts_nested_attributes_for :pictures
end
