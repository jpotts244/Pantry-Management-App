module FoodsHelper
	def food_class(expiration_date)
		if expiration_date < Date.today
			"bg-danger food-expired"
		elsif expiration_date <= (Date.today + 2.days)
			"bg-warning food-about-to-expire"
		else
			""
		end	
	end
end