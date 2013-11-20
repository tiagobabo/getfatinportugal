class MainController < ApplicationController
  
  def index
     @products_all = Product.where(is_active: 1) 
     @products_slider = @products_all.sample(3)
  end
  
  def faq
  end
  
end
