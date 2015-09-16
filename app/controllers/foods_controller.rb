class FoodsController < ApplicationController
	def index
		@user = User.find(params[:user_id])
		@foods = @user.foods
	end

	def new
		@user = User.find(params[:user_id])
		@food = Food.new
	end

	def create
		@user = User.find(params[:user_id])
		@foods = Foods.create(food_params)
		redirect_to user_path(@user) 
	end

	def edit
		@food = Food.find(params[:id])		
	end

	def update
		@food = Food.find(params[:id])
		@food.update(food_params)
		# -------------change this redirect--------------------
		redirect_to @food
	end

	def destroy
		@food = Food.find(params[:id])
		@food.destroy
		redirect_to @food.user
	end

	private
	def food_params
		params.permit(:category_id, :food_name, :quantity, :expiration)
	end
end