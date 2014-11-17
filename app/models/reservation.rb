class Reservation < ActiveRecord::Base
	belongs_to :restaurant
	belongs_to :customer

	validate :availability

	private
	def availability
		unless restaurant.available?(party_size, book_time)
			errors.add(:base, "Restaurant not available.")
			# errors.add(:book_time, " is fully booked at this time")
		end
	end
end


#specific errors
