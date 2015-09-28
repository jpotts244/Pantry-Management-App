class UserMailer < ActionMailer::Base
	default :from => ENV['EMAIL_USER_NAME']

	def send_welcome_email(user)
		@user = user
		mail( :to => @user.email, 
			:subject => "Welcome to Foodie!" )
	end

	def send_expiration_warning_email(user)
		@user = user
		@food = @user.foods
		
		mail( :to => @user.email,
			:subject => "Your food is about to expire!" )
	end
end
