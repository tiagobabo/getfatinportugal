class ProductsController < ApplicationController
	def view_details
		@product = Product.find(params[:id])
		
		@twitter = Twitter::Client.new
    @twitter = @twitter.search(@product.hashtag, :include_entities=>"t", :count => 6, :result_type => "recent")
    gon.twitter=@twitter
    gon.hashtag=@product.hashtag
	gon.region = @product.region
  end
end
