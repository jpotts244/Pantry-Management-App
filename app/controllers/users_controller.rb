class UsersController < ApplicationController
	
	# def index
	# 	@users = User.all
	# end

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save
			session[:user_id] = @user_id
			flash[:success] = "Welcome to Foodie!"
			redirect_to user_foods_path(@user)
		else
			render 'new'
		end
	end

	# --------------Show User Account Information ------------
	def show
		if params[:id].to_i == current_user.id
			@user = User.find(params[:id])
			
	  		
		else
			redirect_to '/login'
		end	
			
	end

	def edit
		@user = User.find(params[:id])
	end
	
	def update
		@user = User.find(params[:id])
		@user.update(user_params)
		redirect_to current_user
	end

	def destroy
	end

	private
	def user_params
		params.require(:user).permit(:name, :email, :password)
	end
end