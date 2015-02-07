class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
        t.text :content
        t.string :tweet_location
        t.integer :user_id
        t.integer :in_reply_to_id
        t.timestamps
    end
  end
end
