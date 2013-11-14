class AddClientTypeToClient < ActiveRecord::Migration
  def change
    add_column :clients, :client_type_id, :integer
    add_index :clients, :client_type_id
  end
end
