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
    
    event :publish_on_ru do
      transition all - :published_on_ru => :published_on_ru
    end
    
    event :publish_on_en do
      transition all - :published_on_en => :published_on_en
    end
    
    event :publish_on_de do
      transition all - :published_on_de => :published_on_de
    end
    
    event :unpublish do
      transition :published => :unpublished
    end
  end
  
  scope :published_all, -> { where(state: :published) }
  scope :published, -> {
    case I18n.locale
      when :ru then where('"news"."state"="published" OR "news"."state"="published_on_ru"')
      when :en then where('"news"."state"="published" OR "news"."state"="published_on_en"')
      when :de then where('"news"."state"="published" OR "news"."state"="published_on_de"')
    end
  }
  
end
