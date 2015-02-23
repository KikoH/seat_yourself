class Reservation < ActiveRecord::Base
	belongs_to :restaurant
	belongs_to :customer

	validate :availability

	def pretty_book_time
		book_time.strftime("%I %p ")
	end

	private
	def availability
		unless restaurant.available?(party_size, book_time)
			errors.add(:base, "Restaurant not available.")
			# errors.add(:book_time, " is fully booked at this time")
		end
	end

end
