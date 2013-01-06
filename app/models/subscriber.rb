class Subscriber < ActiveRecord::Base
  attr_accessible :email, :fio, :notify_about_center_events, :phone, :processing_personal_data

  validates :email, presence: true, email: true
  validates :fio, presence: true
  validates :phone, presence: true
end
