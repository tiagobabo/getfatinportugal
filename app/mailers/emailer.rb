class Emailer < ActionMailer::Base
  default from: "deliciouslyportugal@gmail.com"
  
  def welcome_email(user)
          @user=user
    mail(to: @user, subject: 'Welcome to My Awesome Site', message: 'Eheh isto bomba' )
	end
	
	def contact_us(name, email, subject, message)
		@info = [name, email, subject, message];
		mail(to: 'deliciouslyportugal@gmail.com', subject: 'New contact' )
	end
	
	def advertise(name, email, phone, message)
		@info = [name, email, phone, message];
		mail(to: 'deliciouslyportugal@gmail.com', subject: 'New contact' )
	end
	
	def suggest_us(name, email, contact, suggested_prod)
		@info = [name, email, contact, suggested_prod];
		mail(to: 'deliciouslyportugal@gmail.com', subject: 'New suggestion' )
	end
	
	def new_interest(client_name,address, locality, person_in_charge, email, phone, product)
		@info = [client_name, address, locality, person_in_charge, email, phone, product]
		mail(to: 'deliciouslyportugal@gmail.com', subject: 'New client interest' )
	end
	
end