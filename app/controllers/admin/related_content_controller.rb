class Admin::RelatedContentController < ApplicationController
  layout 'admin'
  before_filter :authenticate_user!
  
def relation_with_products
end  

end
