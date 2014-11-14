class Reservation < ActiveRecord::Base
	belongs_to :restaurant
	belongs_to :customer

	validate :availability

	private
	def availability
		unless restaurant.available?(party_size, time)
			errors.add(:base, "Restaurant is full")
		end
	end
end
