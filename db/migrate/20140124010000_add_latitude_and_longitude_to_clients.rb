class AddLatitudeAndLongitudeToClients < ActiveRecord::Migration
  def change
    add_column :clients, :latitude, :string
    add_column :clients, :longitude, :string
  end
end
