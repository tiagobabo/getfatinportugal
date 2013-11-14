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
    
  end
  
  def show
    
  end
  
end
