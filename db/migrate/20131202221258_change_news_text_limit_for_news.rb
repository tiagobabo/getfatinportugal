class ChangeNewsTextLimitForNews < ActiveRecord::Migration
  change_table :news do |t|  
          t.change :news_text, :text , :limit => 16777215
      end
end
