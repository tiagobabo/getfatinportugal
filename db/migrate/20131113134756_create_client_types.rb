class CreateClientTypes < ActiveRecord::Migration
  def change
    create_table :client_types do |t|
      t.string :name, :null => false

      t.timestamps
    end
    add_index :client_types, :name, :unique => true
  end
end
