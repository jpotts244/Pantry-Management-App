class Food < ActiveRecord::Base
  belongs_to :user
  belongs_to :category

  validates :food_name, presence: true
  validates :quantity, presence: true
  validates :expiration, presence: true

# defines search method
  def self.search(search)
	  	where("food_name like ?", "%#{search}%")
  	end
end
