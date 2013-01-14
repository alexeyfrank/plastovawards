class Member < ActiveRecord::Base
  
  # before_create :set_default_states
  
  attr_accessible :nomination_id, :birth_year, :city, :country, :email, :first_name, :last_name, :phone, :pictures_attributes, :state_event, :year

  validates :birth_year, presence: true
  validates :city, presence: true
  validates :country, presence: true
  validates :email, presence: true, email: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :phone, presence: true
 
  # belongs_to :bid_state  
  #     belongs_to :competition_state
  belongs_to :nomination
  

  has_many :pictures, class_name: "MemberPicture", dependent: :destroy
  
  accepts_nested_attributes_for :pictures
    # 
    # def set_default_states
    #   self.bid_state = BidState.find 1
    #   self.competition_state = CompetitionState.find 1
    # end
  
  def fio
    "#{ self.first_name } #{ self.last_name }"
  end
  
  def self.years
    Member.uniq.pluck(:year)
  end
  
  state_machine :state, initial: :unpublished do
    event :publish do
      transition all - :published => :published
    end
    event :add_to_short_list do
      transition all - :in_short_list => :in_short_list
    end
    event :add_to_winners do
      transition all - :winner => :winner
    end
    event :unpublish do
      transition all - :unpublished => :unpublished
    end
  end
  
end
