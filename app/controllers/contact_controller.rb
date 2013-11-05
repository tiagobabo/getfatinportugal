class ContactController < ApplicationController
	def index
	end
	
	def suggest_food
	  @categories = Category.all.map{|x| [x.name, x.id]}
	  @product = Product.new
	  gon.projects=session[:projects]
	  respond_to do |format|
		format.html # new.html.erb
		format.json { render json: @product }
	  end
	end
	
	def sendemail	
		Emailer.contact_us(params[:name], params[:email], params[:subject], params[:message]).deliver
		
		 respond_to do |format|
			format.html { redirect_to main_index_path, notice: 'Email was successfully sent.' }     
	 	 end
	end
	
	def test
	end 

end
