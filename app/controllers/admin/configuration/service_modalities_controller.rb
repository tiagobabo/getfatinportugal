class Admin::Configuration::ServiceModalitiesController < Admin::AdminController
layout 'admin'

def index
@service_modalities = ServiceModality.all
respond_to do |format|
	  format.html 
	  format.json { render json: @service_modality }
	end
end

def show

end

def create 
 @service_modality = ServiceModality.new(params[:service_modality])   
    respond_to do |format|
      if @service_modality.save
	    flash[:notice] = "Service modality was successfully created."
        format.html { redirect_to :action => 'new'}
        format.json { render json: @service_modality, status: :created, location: @service_modality }
      else
        format.html { render action: "new" }
        format.json { render json: @service_modality.errors, status: :unprocessable_entity }
      end
    end
end

def new 
@service_modality = ServiceModality.new
respond_to do |format|
      format.html 
      format.json { render json: @service_modality }
    end
end

def destroy
@service_modality = ServiceModality.find(params[:id])
     @service_modality.destroy

     respond_to do |format|
       format.html {redirect_to admin_configuration_service_modalities_path }
       format.js   { render :nothing => true }
     end
end

def update
 @service_modality = ServiceModality.find(params[:id])

    respond_to do |format|
      if @service_modality.update_attributes(params[:service_modality])
	   flash[:notice] = "Service modality was successfully updated."
        format.html { redirect_to  :action => 'edit' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @service_modality.errors, status: :unprocessable_entity }
      end
    end
end

def edit
@service_modality = ServiceModality.find(params[:id])
end

end
