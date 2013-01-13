class Nomination < ActiveRecord::Base
  attr_accessible :name, :state_event, :state

  translates :name
  
  has_many :members
  
  validates :name, presence: true
  
  
  state_machine :state, initial: :unpublished do
  
    event :publish do
      transition :unpublished => :published
    end
    
    event :unpublish do
      transition :published => :unpublished
    end
    
  end
  
  scope :published, -> { where(state: :published) }
end
