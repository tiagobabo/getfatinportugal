class Product < ActiveRecord::Base
  scope :active , -> { where is_active: 1}
  scope :inactive , -> { where is_active: 0}
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

  attr_accessible :description, :hashtag, :name, :photo, :region, :category_id, :category, :latitude, :longitude, :is_active, :is_special_product

  def next
    Product.where("products.id > ?", self.id).order("products.id ASC").limit(1)
  end

  def previous
    Product.where("products.id < ?", self.id).order("products.id DESC").limit(1)
  end
end