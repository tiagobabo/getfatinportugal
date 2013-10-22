class SuggestController < ApplicationController
	def index
		@product_suggestion = Product.new
		@categories = Category.all.map{|x| [x.name, x.id]}

		respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @product }
  end
end

def set_suggestion
:product
end

end