class ChangeNewsTextLimitForNews < ActiveRecord::Migration
  change_table :news do |t|  
          t.change :news_text, :text , :limit => 4294967295
      end
end
