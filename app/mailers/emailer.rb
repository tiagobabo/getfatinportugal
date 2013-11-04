class Emailer < ActionMailer::Base
  default from: "deliciouslyportugal@gmail.com"
  
  def welcome_email(user)
          @user=user
    mail(to: @user, subject: 'Welcome to My Awesome Site', message: 'Eheh isto bomba' )
	end
	
	def contact_us(name, email, subject, message)
		@info = [name, email, subject, message];
		mail(to: 'deliciouslyportugal@gmail.com', subject: 'New contact:' )
	end
	
end