class CreateJoinTableHashtagsAndTweets < ActiveRecord::Migration
  def change
    create_table :hashtags_tweets do |j|
      j.integer :tweet_id
      j.integer :hashtag_id
    end
  end
end
