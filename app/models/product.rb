class Product < ActiveRecord::Base
  belongs_to :category

  attr_accessible :description, :hashtag, :name, :photo, :region, :category_id, :category, :latitude, :longitude, :isactive

  def next
    Product.where("products.id > ?", self.id).order("products.id ASC").limit(1)
  end

  def previous
    Product.where("products.id < ?", self.id).order("products.id DESC").limit(1)
  end
end
