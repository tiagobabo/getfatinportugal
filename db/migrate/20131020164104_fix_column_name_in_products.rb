class FixColumnNameInProducts < ActiveRecord::Migration
 def change
    rename_column :products, :IsActive, :isactive
  end
end
