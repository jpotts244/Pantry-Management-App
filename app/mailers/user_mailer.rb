class UserMailer < ActionMailer::Base
	default :from => ENV['EMAIL_USER_NAME']

	def send_welcome_email(user)
		@user = user
		mail( :to => @user.email, 
			:subject => "Welcome to Foodie!" )
	end
end
