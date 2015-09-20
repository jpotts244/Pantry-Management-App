class FoodsController < ApplicationController
	
	def search
		if params[:search]
			@food = Food.search(params[:search])
			render :show
		end 
	end

	def index
		@user = User.find(params[:user_id])
		@foods = @user.foods
		@category = Category.all
		@food = Food.new
	end


	def new
		@user = User.find(params[:user_id])
		@food = Food.new
	end

	def create
		@food = Food.new(food_params)
		if @food.save
			render :partial => "food.html", locals: { food: @food }
		else
			render json: @food.errors, status: :unprocessable_entity
		end
	end

	def show
		if params[:id].to_i == current_user.id
			@user = User.find(params[:id])
			@foods = @user.foods
		end
	end

	def edit
		@food = Food.find(params[:id])		
	end

	def update
		@food = Food.find(params[:id])
		@food.update(food_params)
		redirect_to user_foods_path
	end

	def destroy
		@food = Food.find(params[:id])
		@food.destroy
		render :json => :success
	end

	private
	def food_params
		params
		.require(:food)
		.permit(:category_id, :food_name, :quantity, :expiration)
		.merge({user_id: current_user.id})

	end
end