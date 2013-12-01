class New < ActiveRecord::Base
  scope :active , -> { where is_active: true}
  scope :inactive , -> { where is_active: false}
  extend FriendlyId
  friendly_id :title, use: [:slugged, :history]
  attr_accessible :image, :is_active, :news_text, :source, :subtitle, :title
end
