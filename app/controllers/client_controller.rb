class ClientController < ApplicationController
  
  def index
  end
  
  def show
    @client = Client.find(params[:id])
    gon.address = @client.address
  end
end
