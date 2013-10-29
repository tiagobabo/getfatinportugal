class Admin::ProductsController < ApplicationController
layout 'admin'
#before_filter :authenticate_user!
# GET /products/1
  # GET /products/1.json
  def show
    @products = Product.where("is_active=1")
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @products }
    end
  end

def index
end

def new
   @categories = Category.all.map{|x| [x.name, x.id]}
   @product = Product.new
   
   respond_to do |format|
         format.html # new.html.erb
         format.json { render json: @product }
       end
end



# POST /products
 # POST /products.json
 def create
   @product = Product.new(params[:product])
@categories = Category.all.map{|x| [x.name, x.id]}
   respond_to do |format|
     if @product.save
       format.html { redirect_to [:admin, @product], notice: 'Product was successfully created.' }
       format.json { render json: @product, status: :created, location: @product }
     else
       format.html { render action: "new" }
       format.json { render json: @product.errors, status: :unprocessable_entity }
     end
   end
 end
end