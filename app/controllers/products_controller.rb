class ProductsController < ApplicationController
  def show
   @product = Product.find(params[:id])    
   
   if request.path != product_path(@product)
	redirect_to @product, status: :moved_permanently
	end
	
    gon.projects=session[:projects]

   
	
	
	
    @twitter = Twitter::Client.new
    @twitter = @twitter.search(@product.hashtag, :include_entities=>"t", :count => 6, :result_type => "recent")
    
    gon.twitter=@twitter
    gon.hashtag=@product.hashtag
    gon.region = @product.region
	gon.latitude  = @product.latitude
	gon.longitude = @product.longitude
  end

  def index
  end
  
  
  def prods_by_category
    gon.projects=session[:projects]
    
    @products = Product.where(category_id: params[:id])	   
    @category_name= @products.first.category.name       
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @products }
    end

  end
end
