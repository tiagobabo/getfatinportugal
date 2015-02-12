class ProductsController < ApplicationController
  caches_action :show
  def show
    @product = Product.find(params[:id])    

    if request.path != product_path(@product)
      redirect_to @product, status: :moved_permanently
    end

    @twitter = Twitter::Client.new
    @twitter = @twitter.search(@product.hashtag, :include_entities=>"t", :count => 6, :result_type => "recent")

    gon.twitter=@twitter

    #hack to assure that every product has the # symbol.
    if @product.hashtag[0].to_s == "#"
      gon.hashtag=@product.hashtag
    else gon.hashtag="#"+@product.hashtag
    end
    gon.region = @product.region
    gon.latitude  = @product.latitude
    gon.longitude = @product.longitude

    client=Client.new
    @clients = client.get_clients_for_product_with_active_plan(@product.id)
    @relatedProducts = Product.active.joins("inner join related_contents as rc on rc.id_related_to=products.id").where("rc.id_parent="+@product.id.to_s).order('created_at DESC') 

  end

  def index
  end


  def prods_by_category

    @category = Category.find(params[:id])

    @other_categories = Category.where("categories.id != ?",@category.id)    

    products_list = Product.active	       
    @products = products_list.where(category_id: @category.id)
    @products_others = products_list.where("products.category_id != ?", @category.id)

    @twitter = Twitter::Client.new
    @twitter = @twitter.search(@category.slug, :include_entities=>"t", :count => 6, :result_type => "recent")

    gon.twitter=@twitter
    gon.hashtag='#'+@category.slug

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @products }
    end

  end
end
