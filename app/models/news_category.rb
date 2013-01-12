class NewsCategory < ActiveRecord::Base
  attr_accessible :state, :title, :state_event  
  
  has_many :news, class_name: :News, foreign_key: :category_id
  
  validates :title, presence: true
  
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
