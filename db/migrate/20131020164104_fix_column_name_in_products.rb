class FixColumnNameInProducts < ActiveRecord::Migration
 def change
    rename_column :products, :isactive, :isactive
  end
end
