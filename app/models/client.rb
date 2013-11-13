class Client < ActiveRecord::Base
  attr_accessible :address, :email, :location, :mobile_phone, :name, :nif, :person_in_charge, :phone, :postal_code
end
