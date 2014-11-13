class Owner < User
	has_many :restaurants
	belongs_to :user
end