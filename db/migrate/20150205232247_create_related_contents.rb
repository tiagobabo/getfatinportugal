class CreateRelatedContents < ActiveRecord::Migration
  def change
    create_table :related_contents do |t|
      t.integer :type_relation
      t.integer :id_parent
      t.integer :id_related_to
      t.integer :is_active

      t.timestamps
    end
  end
end
