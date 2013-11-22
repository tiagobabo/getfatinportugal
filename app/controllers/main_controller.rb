class MainController < ApplicationController
  
  def index
     @products_all = Product.active 
     @products_slider = @products_all.sample(3)
  end
  
  def faq
    products_all = Product.active.order('created_at DESC')
    @products_recent = products_all.limit(4)
    @products_random = products_all.sample(4) 
  end
  
end
