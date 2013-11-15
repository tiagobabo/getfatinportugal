class ClientProduct < ActiveRecord::Base
belongs_to :product
belongs_to :client
  attr_accessible :client_id, :created_at, :position, :product_id
end
