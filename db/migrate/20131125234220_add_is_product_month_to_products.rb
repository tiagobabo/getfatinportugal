class AddIsProductMonthToProducts < ActiveRecord::Migration
  def change
    add_column :products, :is_special_product, :integer
    add_index :products, :is_special_product
  end
end
