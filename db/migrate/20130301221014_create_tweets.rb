class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.string :content
      t.integer :user_id
      t.boolean :has_answer, :default => false

      t.timestamps
    end
  end
end
