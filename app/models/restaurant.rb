class Restaurant < ActiveRecord::Base
	has_many :reservations
	has_many :reviews
	belongs_to :owner

	def available?(party_size, book_time)
		# 2:21 vs 2:00
		reserved = reservations.where(:book_time => book_time).sum(:party_size)
		if (party_size <= (capacity - reserved)) && (book_time.hour.between?(open_time.hour, close_time.hour))
			return true
		else 
			return false
		end
	end

end