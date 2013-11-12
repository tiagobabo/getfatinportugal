class Admin::CategoriesController < ApplicationController
  layout 'admin'
  before_filter :authenticate_user!
  def index
  @categories = Category.all
  end
  
  def show 
  end
  
  def new
    @category = Category.new
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @category }
    end
  end
  
  def create 
    @category = Category.new(params[:product])    
    respond_to do |format|
      if @category.save
        format.html { redirect_to [:admin, :categories], notice: 'Category was successfully created.' }
        format.json { render json: @category, status: :created, location: @category }
      else
        format.html { render action: "new" }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def destroy
    @category = Category.find(params[:id])
     @category.destroy

     respond_to do |format|
       format.html {redirect_to admin_categories_path }
       format.js   { render :nothing => true }
     end
  end
  
  def update 
    @category = Category.find(params[:id])

    respond_to do |format|
      if @category.update_attributes(params[:category])
        format.html { redirect_to  [:admin, :categories], notice: 'Category was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def edit
    @category = Category.find(params[:id])
  end
  
end
