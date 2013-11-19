class CreateServiceModalities < ActiveRecord::Migration
  def change
    create_table :service_modalities do |t|
      t.string :name, :null => false

      t.timestamps
    end
    add_index :service_modalities, :name, :unique => true
  end
end
