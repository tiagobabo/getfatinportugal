class MainController < ApplicationController

	def index		
		@urls = Category.limit(4).map{|x| Product.where(:category_id => x.id).sample.photo}		
		@products_all = Product.where(is_active: 1) 
		gon.projects=@products_all.map{|x| {"value" => x.name, "id" => x.id, "icon" => x.photo, "category_id"=>x.category_id}} 
		respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @products }
  end
end

end
