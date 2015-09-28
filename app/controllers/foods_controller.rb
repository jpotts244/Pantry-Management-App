class FoodsController < ApplicationController

	
	def search
		if params[:search]
			@user = User.find(params[:user_id])
			@food = @user.foods.search(params[:search])
			render :show
		end 

	end

	def index
		@search_bar = true
		@user = User.find(params[:user_id])
		@foods = @user.foods.order(:id)

		
		send_warning = false
		@foods.each do |food|
			if food.expiration <= (Date.today + 2.days)
				send_warning = true
			# else  send_warning = false
			end
		end

		if send_warning = true

			UserMailer.send_expiration_warning_email(@user).deliver_now
		end
		@category = Category.all
		@food = Food.new

	end
# --------- FIX THIS ------------
	# def warn_user
	# 	@user = User.find(params[:user_id])
	# 	@foods = @user.foods
	# 	send_warning = false
	# 	@foods.each do |food|
	# 		if food.expiration <= (Date.today + 2.days)
	# 			send_warning = true
	# 		# else  send_warning = false
	# 		end
	# 	end

	# 	if send_warning = true

	# 		UserMailer.send_expiration_warning_email(@user).deliver_now
	# 	end
	# end

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
		@search_bar = true
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
		if @food.update(food_params)
			render :partial => "food.html", locals: { food: @food }
		else
			render json: @food.errors, status: :unprocessable_entity
		end
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