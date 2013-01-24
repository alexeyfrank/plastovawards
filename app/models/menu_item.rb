class MenuItem < ActiveRecord::Base
  attr_accessible :ancestry, :klass, :name, :slug, :menu_id, :position, :parent_id
  belongs_to :menu
  
  translates :name

  validates :name, presence: true
  validates :slug, presence: true #, slug: true
  validates :position, presence: true
  validates :menu, presence: true

  has_ancestry

  def self.to_tree(menu_id) 
    self.where(menu_id: menu_id).includes(:translations).arrange(order: :position)
  end

  def current?(request_uri)
    "/#{slug}" == request_uri
  end
end
