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

	def show
		if params[:id].to_i == current_user.id
			@user = User.find(params[:id])
	  		@tasks = @user.tasks
	  		@messages = @user.messages
			redirect_to user_foods_path(@user)
		else
			redirect_to '/login'
		end
		
			
	end

	# -------do I want this?-------
	# def update
	# 	@user = User.find(params[:id])
	# end

	# def destroy
	# end

	private
	def user_params
		params.require(:user).permit(:name, :email, :password)
	end
end