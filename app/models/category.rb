class Category < ActiveRecord::Base
	has_many :foods
	has_many :users, through: :foods 
end
