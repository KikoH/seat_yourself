class Restaurant < ActiveRecord::Base
	has_many :reservations
	has_many :reviews
	belongs_to :owner

	def available?(party_size, time)
		reserved = reservations.sum(:party_size)
		party_size <= (capacity - reserved)
	end
end
