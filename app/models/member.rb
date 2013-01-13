class Member < ActiveRecord::Base
  
  before_create :set_default_states
  
  attr_accessible :bid_state_id, :nomination_id, :birth_year, :city, :competition_state_id, :country, :email, :first_name, :last_name, :phone, :pictures_attributes

  validates :birth_year, presence: true
  validates :city, presence: true
  validates :country, presence: true
  validates :email, presence: true, email: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :phone, presence: true

  belongs_to :bid_state
  belongs_to :competition_state
  belongs_to :nomination
  

  has_many :pictures, class_name: "MemberPicture", dependent: :destroy
  
  accepts_nested_attributes_for :pictures
  
  def set_default_states
    self.bid_state = BidState.find 1
    self.competition_state = CompetitionState.find 1
  end
  
end
