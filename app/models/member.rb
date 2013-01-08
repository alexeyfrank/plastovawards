class Member < ActiveRecord::Base
  attr_accessible :bid_state, :birth_year, :city, :competition_state, :country, :email, :first_name, :last_name, :phone

  belongs_to :bid_state
  belongs_to :competition_state
end
