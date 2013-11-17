class Admin::ClientsController < ApplicationController
  layout 'admin'
  before_filter :authenticate_user!
  
  def index
    @clients = Client.all
          
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
    @client = Client.new(params[:client]) 	
	  
	  respond_to do |format|
      if @client.create_client_with_products_and_payment_plan(params, @client)
        flash[:notice]='Client was successfully created.'
        format.html { redirect_to :action => 'new'}
        format.json { render json: @client, status: :created, location: @client }
      else
        format.html { render action: "new" }
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def show
     @client = Client.find(params[:id])   
     	@client_types = ClientType.all.map{|x| [x.name, x.id]} 
    respond_to do |format|
         format.html 
         format.json { render json: @client }
       end
  end
  
end
