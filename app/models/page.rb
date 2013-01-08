class Page < ActiveRecord::Base
  attr_accessible :author, :content, :title, :state, :tags, :tag_list, :slug, :is_home_page

  belongs_to :author, :class_name => :User

  validates :author, :presence => true
  validates :title, :presence => true
  validates :slug, :presence => true, :slug => true

  acts_as_taggable_on :tags
  
  translates :title, :content, :fallbacks_for_empty_translations => true

  state_machine :initial => :unpublished do
    event :publish do
      transition [:unpublished, :trashed] => :published
    end

    event :unpublish do
      transition [:trashed, :published] => :unpublished
    end

    event :trash do
      transition all - :trashed => :trashed
    end
  end
  
  scope :home_page, -> { where(is_home_page: true) }
end
