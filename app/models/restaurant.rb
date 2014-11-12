class Restaurant < ActiveRecord::Base
	has_many :reservations
	has_many :reviews
	belongs_to :owner
end
