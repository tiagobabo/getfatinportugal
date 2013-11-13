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
	
	def suggest	
	@product = Product.new(params[:product])
  
  Emailer.suggest_us(params[:name_user], params[:email_user], params[:phone_user], @product.name).deliver
	
  
    respond_to do |format|
      if @product.save
        format.html { redirect_to main_index_path, notice: 'Product was successfully created.' }
        format.json { render json: @product, status: :created, location: @product }
      else
        format.html { render action: "new" }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
	end 
	
	def send_client_interest
	@product = Product.find(params[:product])
	Emailer.new_interest(params[:name], params[:address], params[:locality],params[:person_in_charge],params[:email],params[:phone],  @product.name).deliver
		 flash[:notice] = "Email was successfully sent."
		respond_to do |format|
			format.html { redirect_to :action=> 'interest' }     
	 	 end
	end
	
	def interest
	 @products = Product.where(is_active: 1)
	gon.projects=session[:projects]
	end

end
