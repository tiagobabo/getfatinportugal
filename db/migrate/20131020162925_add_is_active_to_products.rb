class AddIsActiveToProducts < ActiveRecord::Migration
  def change
    add_column :products, :isactive, :integer, :default => 1
  end
end