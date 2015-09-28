class User < ActiveRecord::Base
	has_many :foods
	has_many :categories, through: :foods
	validates :name, presence: true
	# validates :email, presence: true, uniqueness: {case_sensitive: false}
	validates :password, presence: true

	has_secure_password
end
