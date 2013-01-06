class Menu < ActiveRecord::Base
  attr_accessible :description, :name

  has_many :menu_items
end
