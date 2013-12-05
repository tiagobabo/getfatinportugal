class AddCountryIdAndMottoToClient < ActiveRecord::Migration
  def change
    add_column :clients, :country_id, :integer
    add_index :clients, :country_id
    add_column :clients, :motto, :string
  end
end
