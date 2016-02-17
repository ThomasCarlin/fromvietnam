class AuthenticationMailer < ApplicationMailer
  	default from: "tcarlin11@gmail.com"
	def authenticate_email()
		mail(to: "tcarlin11@gmail.com", subject: 'New Case Added')
	end
end
