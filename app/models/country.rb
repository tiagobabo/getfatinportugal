class Country < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: [:slugged, :history]
  attr_accessible :iso2, :iso3, :name, :numcode, :latitude, :longitude
end
