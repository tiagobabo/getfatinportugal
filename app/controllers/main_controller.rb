class MainController < ApplicationController
  
  def index
     @products_all = Product.where(is_active: 1) 
     @products_slider = @products_all.sample(3)
  end
  
  def faq
    products_all = Product.where(is_active: 1) 
    @products_recent = products_all.order(created_at: :desc).first(4)
    @products_random = products_all.sample(4) 
  end
  
end
