class AuthenticationMailer < ApplicationMailer
  	default from: "tcarlin11@gmail.com"
	def authenticate_email(user)
		@user = user
		mail:(to: default, subject: 'New Case Added')
	end
end
