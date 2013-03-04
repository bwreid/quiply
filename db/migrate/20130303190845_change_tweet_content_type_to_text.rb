class ChangeTweetContentTypeToText < ActiveRecord::Migration
  def change
    remove_column :tweets, :content
    add_column :tweets, :content, :text
  end
end
