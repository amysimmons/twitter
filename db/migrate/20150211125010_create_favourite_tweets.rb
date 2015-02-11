class CreateFavouriteTweets < ActiveRecord::Migration
  def change
    create_table :favourite_tweets do |t|
      t.integer :tweet_id
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
