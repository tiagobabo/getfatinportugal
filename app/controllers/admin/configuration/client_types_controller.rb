class Admin::Configuration::ClientTypesController < Admin::AdminController
layout 'admin'
def index
@client_types = ClientType.all
respond_to do |format|
      format.html 
      format.json { render json: @client_types }
    end
end

def show

end

def create 
 @client_type = ClientType.new(params[:client_type])   
    respond_to do |format|
      if @client_type.save
	    flash[:notice] = "Client type was successfully created."
        format.html { redirect_to :action => 'new'}
        format.json { render json: @client_type, status: :created, location: @client_type }
      else
        format.html { render action: "new" }
        format.json { render json: @client_type.errors, status: :unprocessable_entity }
      end
    end
end

def new 
@client_type = ClientType.new
respond_to do |format|
      format.html 
      format.json { render json: @client_type }
    end
end

def destroy
@client_type = ClientType.find(params[:id])
     @client_type.destroy

     respond_to do |format|
       format.html {redirect_to admin_configuration_client_types_path }
       format.js   { render :nothing => true }
     end
end

def update
 @client_type = ClientType.find(params[:id])

    respond_to do |format|
      if @client_type.update_attributes(params[:client_type])
	   flash[:notice] = "Client type was successfully updated."
        format.html { redirect_to  :action => 'edit' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @client_type.errors, status: :unprocessable_entity }
      end
    end
end

def edit
@client_type = ClientType.find(params[:id])
end
end
