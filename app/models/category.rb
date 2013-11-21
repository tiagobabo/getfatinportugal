class Category < ActiveRecord::Base
  attr_accessible :name
  extend FriendlyId
  friendly_id :name, use: [:slugged, :history]
end
