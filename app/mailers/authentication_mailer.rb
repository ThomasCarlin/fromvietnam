class AuthenticationMailer < ApplicationMailer
  	default from: "TomCarlinFromVietnam@gmail.com"
	def authenticate_email(user)
		@user = user
		mail(to: "tcarlin11@gmail.com", subject: 'New Case Added')
	end
end
