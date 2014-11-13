class Customer < User
	has_many :reservations
	has_many :reviews
	belongs_to :user
end