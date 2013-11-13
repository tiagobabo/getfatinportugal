class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :name
      t.string :address
      t.string :nif
      t.string :email
      t.string :phone
      t.string :mobile_phone
      t.string :person_in_charge
      t.string :location
      t.string :postal_code

      t.timestamps
    end
  end
end
