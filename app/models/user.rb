class User < ActiveRecord::Base
  has_secure_password
  attr_accessible :email, :first_name, :last_name, :password

  has_many :pages, :class_name => :Page, :foreign_key => :author_id, :dependent => :restrict
  has_many :news, :class_name => :News, :foreign_key => :author_id, :dependent => :restrict

  validates :email, :presence => true, :uniqueness => true, :email => true
  validates :password, :presence => true, :length => { :minimum => 5 }

end
