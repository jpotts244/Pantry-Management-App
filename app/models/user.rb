class User < ActiveRecord::Base
	has_many :foods
	has_many :categories, through: :foods

	has_secure_password
end
