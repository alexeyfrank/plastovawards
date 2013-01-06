class Page < ActiveRecord::Base
  attr_accessible :author, :content, :title, :state, :tags, :tag_list, :slug

  belongs_to :author, :class_name => :User

  validates :author, :presence => true
  validates :title, :presence => true
  validates :slug, :presence => true, :slug => true

  acts_as_taggable_on :tags

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

end
