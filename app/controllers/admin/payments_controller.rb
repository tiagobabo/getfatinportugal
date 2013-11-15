class Admin::PaymentsController < ApplicationController

def show_payment_plan
	if request.xhr?
		@service_modalities = ServiceModality.all
#.map {|x| [x.name, x.name]}			
		render :partial => 'admin/payments/payment_plan_set', :object => @service_modalities
	end
end


end
