class ProductsController < ApplicationController
  def view_details
    gon.projects=session[:projects]

    @product = Product.find(params[:id])    
    @twitter = Twitter::Client.new
    @twitter = @twitter.search(@product.hashtag, :include_entities=>"t", :count => 6, :result_type => "recent")
    
    gon.twitter=@twitter
    gon.hashtag=@product.hashtag
    gon.region = @product.region
  end

  def prods_by_category
    gon.projects=session[:projects]
    
    @products = Product.where(category_id: params[:id])	   
    @category_name= @products.first.name       
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @products }
    end

  end
end
