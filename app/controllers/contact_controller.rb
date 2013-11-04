class ContactController < ApplicationController
	def index
	end
	
	def suggest_food
	  @categories = Category.all.map{|x| [x.name, x.id]}
	end
	
	def sendemail
		name = params[:name]
		email = params[:email]
		subject = params[:subject]
		message =  params[:message]

		Emailer.welcome_email(email).deliver
	end

end
