class Product < ActiveRecord::Base
  belongs_to :category

  attr_accessible :description, :hashtag, :name, :photo, :region, :category_id, :category
end
