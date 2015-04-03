class Admin::RelatedContentController < ApplicationController
  layout 'admin'
  before_filter :authenticate_user!
  
def relation_with_products
end  

def products 
  @all_products = Product.active  
  @related_content =RelatedContent.new
end


def products_related 

    product = Product.where(slug:params[:id]).first
    @existing_relations = Product.joins('INNER JOIN related_contents ON products.id = related_contents.id_related_to and type_relation=1 where related_contents.id_parent = '+product.id.to_s)

    @products = Product.active.where(["id NOT IN (?)", @existing_relations.pluck(:id)])
    if @existing_relations.count==0
      @products = Product.active
    end
    render :partial => "/admin/related_content/products_related", :object => @existing_relations	  
  
end

def recipes
  
end

end
