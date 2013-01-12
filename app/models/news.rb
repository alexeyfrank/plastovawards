class News < ActiveRecord::Base
  attr_accessible :author_id, :category_id, :content, :title, :state, :state_event, :created_at

  belongs_to :author, class_name: :User
  belongs_to :category, class_name: :NewsCategory
  
  validates :title, presence: true
  validates :content, presence: true
  validates :category, presence: true
  validates :author, presence: true
  
  translates :title, :content, :fallbacks_for_empty_translations => true
  
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
