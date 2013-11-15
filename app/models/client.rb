class Client < ActiveRecord::Base
 belongs_to :client_type
 has_many :client_product
 has_many :products, :through => :client_product
 
  attr_accessible :address, :email, :location, :mobile_phone, :name, :nif, :person_in_charge, :phone, :postal_code, :client_type_id
end
