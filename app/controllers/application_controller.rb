class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :set_gon_projects

  def set_gon_projects
    
    if session[:projects].nil?
      session[:projects]= Product.active.order("created_at DESC").map{|x| {"value" => x.name, "slug" => x.slug, "icon" => x.photo, "category_id"=>x.category_id}} 
    end
    
    if @product_of_month.nil?
      @product_of_month= Product.active.where(is_special_product:1).first
    end
    
    gon.projects=session[:projects] 
    
    if session[:recent_products].nil?
      @products_recent =  Product.active.order('created_at DESC').limit(3)
    else @products_recent = session[:recent_products]
    end
  end
end
