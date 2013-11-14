class Client < ActiveRecord::Base
 belongs_to :client_type
  attr_accessible :address, :email, :location, :mobile_phone, :name, :nif, :person_in_charge, :phone, :postal_code, :client_type_id
end
