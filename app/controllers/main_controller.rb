class MainController < ApplicationController

  def index
    @products_all = Product.active.order('created_at DESC')
    #1 - product_month
    #2 - ..... (thing of possible things, like week special, season special, etc...)
    @product_of_month = @products_all.where(is_special_product: 1).first
    @products_slider = @products_all.sample(3)

    #for the tabbed
    @products_recent = @products_all.limit(3)
    @products_random = @products_all.sample(3)

    gon.projects=@products_all.map{|x| {"value" => x.name, "slug" => x.slug, "icon" => x.photo, "category_id"=>x.category_id}} 
    session[:projects] = gon.projects
    
    session[:recent_products] = @products_recent

  end

  def faq
    products_all = Product.active.order('created_at DESC')
    @products_recent_faq = products_all.limit(4)
    @products_random = products_all.sample(4) 
  end

  def donate 
  end

  def newsletter
  end

end
