class Admin::ProductsController < ApplicationController
layout 'admin'
#before_filter :authenticate_user!
def show
 @categories = Category.all.map{|x| [x.name, x.id]}
end

def index
end
end
