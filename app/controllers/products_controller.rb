class ProductsController < ApplicationController
  # GET /products
  # GET /products.json
  def index
    @products = Product.where("is_active=1") 

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @products }
    end
  end

  # GET /products/1
  # GET /products/1.json
  def show
    @product = Product.find(params[:id])
    @next = Product.where("id > ?", @product.id).order("id ASC").limit(1)
    @previous = Product.where("id < ?", @product.id).order("id DESC").limit(1)

    @twitter = Twitter::Client.new
    @twitter = @twitter.search(@product.hashtag, :include_entities=>"t", :count => 6, :result_type => "recent")
    gon.twitter=@twitter
    gon.hashtag=@product.hashtag

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @product }
    end
  end

  # GET /products/new
  # GET /products/new.json
  def new
    @product = Product.new
    @categories = Category.all.map{|x| [x.name, x.id]}

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @product }
    end
  end

  # GET /products/1/edit
  def edit
    @categories = Category.all.map{|x| [x.name, x.id]}
    @product = Product.find(params[:id])
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(params[:product])

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render json: @product, status: :created, location: @product }
      else
        format.html { render action: "new" }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /products/1
  # PUT /products/1.json
  def update
    @product = Product.find(params[:id])

    respond_to do |format|
      if @product.update_attributes(params[:product])
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product = Product.find(params[:id])
    @product.destroy

    respond_to do |format|
      format.html { redirect_to products_url }
      format.json { head :no_content }
    end
  end

  def main
    @urls = Category.all.map{|x| Product.where(:category_id => x.id).sample.photo}

    @projects = Product.where("is_active=1").map{|x| {"value" => x.name, "id" => x.id, "icon" => x.photo}}
	gon.projects = @projects
	gon.urls = @urls

#session[:oauth] = Koala::Facebook::OAuth.new(APP_ID, APP_SECRET, SITE_URL + '/')
#@auth_url =  session[:oauth].url_for_oauth_code(:permissions=>"read_stream publish_stream")  
 
 #redirect_to @auth_url
  #@graph = Koala::Facebook::API.new
   # @facebook_posts=@graph.search("pastel")

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @projects }
    end
  end

  def search
    redirect_to :action => "main"
  end

end
