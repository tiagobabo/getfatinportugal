class Admin::ProductsController < Admin::AdminController
  layout 'admin'
  before_filter :authenticate_user!
  # GET /products/1
  # GET /products/1.json
  def show

  end

  def index
    @categories = Category.all	
    if request.xhr?
      @products = Product.active.where(category_id: params[:id]);		
      render :partial => "/admin/products/list_products", :object => @products
    else
      @products = Product.active		
    end


  end

  def new
    @categories = Category.all.map{|x| [x.name, x.id]}
    @product = Product.new
    gon.latitude = ''
	  gon.longitude = ''
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
        if !params[:products].nil?
          if params[:products].count>0
              params[:products].each do |product_id|
                related_product = RelatedContent.create(:id_parent => @product.id, :id_related_to => product_id, :is_active=>1, :type_relation=>1)
                related_product.save
              end 
           end
         end
        format.html { redirect_to [:admin, :products], notice: 'Product was successfully created.' }
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
          format.html { redirect_to  [:admin, :products], notice: 'Product was successfully updated.' }
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
      format.html {redirect_to  :action => "show" }
      format.js   { render :nothing => true }
    end

  end

  # GET /products/1/edit
  def edit
    @categories = Category.all.map{|x| [x.name, x.id]}
    @product = Product.find(params[:id])
	gon.latitude = @product.latitude
	gon.longitude = @product.longitude
  end

  def prods_category
    if request.xhr?
      if params[:id].to_s == -1.to_s
        @products = Product.active
      else 
        @products = Product.active.where(category_id: params[:id]);	          
      end	
      render :partial => "/admin/products/list_products", :object => @products	
    end
  end
  
  def list_suggestions
   @categories = Category.all	
    if request.xhr?
       if params[:id].to_s == -1.to_s
        @products = Product.inactive            
      else 
        @products = Product.inactive.where(category_id: params[:id]);	          
      end		
    render :partial => "/admin/products/list_products", :object => @products
    else
      @products = Product.inactive
    end
  end
  
  def activate
   if request.xhr?
    @product = Product.find(params[:id])
	@product.update_attributes(:is_active=> 1)
   end
   respond_to do |format|
      format.html {redirect_to  :action => "index" }
      format.js   { render :nothing => true }
    end
  end
  
  def list_all_products
   if request.xhr?
    @products = Product.active
	if params[:id].to_s == 1.to_s
	 render :partial => "/admin/products/list_prod_checkboxes", :object => @products
	 end
   end
  end

def product_month
@products = Product.active.order("name asc")  
@product_of_the_month = @products.where(is_special_product: 1).first
end

def set_prod_month
  Product.active.each do |product|
    product.update_attributes(:is_special_product=> -1)  
  end
   @product = Product.find(params[:product])
	  respond_to do |format|
       if @product.update_attributes(:is_special_product=> 1)  
         format.html { redirect_to  [:admin, :products], notice: 'Product was successfully updated.' }
         format.json { head :no_content }
       else
         format.html { render action: "edit" }
         format.json { render json: @product.errors, status: :unprocessable_entity }
       end
     end
end


end