class Food < ActiveRecord::Base
  belongs_to :user
  belongs_to :category

  validates :food_name, presence: true
  validates :quantity, presence: true
  validates :expiration, presence: true
end
