class AuthenticationMailer < ApplicationMailer
  	default from: "TomCarlinFromVietnam@gmail.com"
	def authenticate_email(user)
		@user = user
		mail(to: "me@tomcarl.in", subject: 'New Case Added')
	end
	def request_info_email(c,email,message)
		@case = c
		@email = email
		@message = message
		mail(to: @case.email, subject: "Someone has requested to contact you!")
	end
end
