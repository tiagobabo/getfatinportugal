class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.string :region
      t.text :description
      t.string :photo
      t.string :hashtag
      t.references :category

      t.timestamps
    end
    add_index :products, :category_id
  end
end
