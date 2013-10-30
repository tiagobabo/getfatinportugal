class Admin::ProductsController < ApplicationController
  layout 'admin'
  #before_filter :authenticate_user!
  # GET /products/1
  # GET /products/1.json
  def show

  end

  def index
    @categories = Category.all
    if request.xhr?
      @products = Product.where(category_id: params[:id])		
      render :partial => "/admin/products/list_products", :object => @products
    else
      @products = Product.where(is_active: 1)		
    end


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
        format.html { redirect_to [:admin, :products], notice: 'Product was successfully created.' }
        format.json { render json: @product, status: :created, location: @product }
      else
        format.html { render action: "new" }
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
      format.html {redirect_to  :action => "show" }
      format.js   { render :nothing => true }
    end

  end

  # GET /products/1/edit
  def edit
    @categories = Category.all.map{|x| [x.name, x.id]}
    @product = Product.find(params[:id])
  end

  def prods_category
    if request.xhr?
      if params[:id].to_s == -1.to_s
        @products = Product.where(is_active: 1)            
      else 
        @products = Product.where(category_id: params[:id])	          
      end	
      render :partial => "/admin/products/list_products", :object => @products	
    end
  end


end