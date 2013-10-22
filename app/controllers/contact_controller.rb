class ContactController < ApplicationController
	def index
	end
	
	def suggest_food
	  @categories = Category.all.map{|x| [x.name, x.id]}
	end
end
