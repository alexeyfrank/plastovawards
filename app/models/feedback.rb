class Feedback < ActiveRecord::Base
  attr_accessible :email, :phone, :text
  
  validates :email, presence: true, email: true
  validates :phone, presence: true
  validates :text, presence: true
end
