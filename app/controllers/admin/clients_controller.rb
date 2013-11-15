class Admin::ClientsController < ApplicationController
  layout 'admin'
  before_filter :authenticate_user!
  
  def index
          
  end
  
  def edit
    
  end
  
  def update
    
  end
  
  def destroy
    
  end
  
  def new
    @client = Client.new
	@client_types = ClientType.all.map{|x| [x.name, x.id]}
	
	respond_to do |format|
      format.html 
      format.json { render json: @client }
    end
    
  end
  
  def create
 @params = params;
 
     @client = Client.new(params[:client]) 
	
	 if @client.save
			
		if params[:products].count>0
			params[:products].each do |product_id|			
				@client_product = ClientProduct.new(:client_id => @client.id, :product_id => product_id, :position => 1, :created_at => Time.now)
				@client_product.save
			end
		end
		@service_modality = ServiceModality.where(name: params[:modality_select]).take(1)
		@payment_plan = PaymentPlan.new(:balance => params[:quantity], :initial_date => params[:date_begin], :end_date => params[:date_end_time])
	#	@payment_plan.save		
	 end
	
  end
  
  def show
    
  end
  
end
