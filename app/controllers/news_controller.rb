class NewsController < ApplicationController
  def index
    @products_random = Product.active.sample(3);
    @news = New.active.order("created_at desc")
  end
  
  def show
    @new = New.find(params[:id])
    get_tab_info()
  end
  
  def get_tab_info
    @news_recent = New.active.order("created_at DESC").limit(3)
    @news_random = New.active.sample(3)
  end
end
