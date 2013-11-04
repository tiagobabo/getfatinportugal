class ContactController < ApplicationController
	def index
	end
	
	def suggest_food
	  @categories = Category.all.map{|x| [x.name, x.id]}
	end
	
	def sendemail	
		Emailer.contact_us(params[:name], params[:email], params[:subject], params[:message]).deliver
		
		 respond_to do |format|
			format.html { redirect_to main_index_path, notice: 'Email was successfully sent.' }     
	 	 end
	end

end
