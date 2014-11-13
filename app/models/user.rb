class User < ActiveRecord::Base
	has_secure_password
	has_many :customers
	has_many :owners
end
