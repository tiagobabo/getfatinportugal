class CreateNews < ActiveRecord::Migration
  def change
    create_table :news do |t|
      t.string :title
      t.string :subtitle
      t.string :news_text
      t.string :source
      t.string :image
      t.boolean :is_active, :default => 1

      t.timestamps
    end
  end
end
