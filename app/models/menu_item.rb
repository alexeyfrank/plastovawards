class MenuItem < ActiveRecord::Base
  attr_accessible :ancestry, :klass, :name, :slug, :menu_id, :position, :parent_id
  belongs_to :menu

  validates :name, presence: true
  validates :slug, presence: true, slug: true
  validates :position, presence: true
  validates :menu, presence: true

  has_ancestry

  def current?(request_uri)
    "/#{slug}" == request_uri
  end
end
