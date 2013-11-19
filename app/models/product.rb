class Product < ActiveRecord::Base
  belongs_to :category
  has_many :client_product
  has_many :clients, :through => :client_product
  validates :description, :presence=>true
  validates :hashtag,  :presence => true
  validates :name, :presence => true
  validates :photo, :presence => true
  validates :region, :presence => true 
validates  :category_id, :presence=>true  

extend FriendlyId
friendly_id :name, use: [:slugged, :history]

  attr_accessible :description, :hashtag, :name, :photo, :region, :category_id, :category, :latitude, :longitude, :is_active

  def next
    Product.where("products.id > ?", self.id).order("products.id ASC").limit(1)
  end

  def previous
    Product.where("products.id < ?", self.id).order("products.id DESC").limit(1)
  end
end