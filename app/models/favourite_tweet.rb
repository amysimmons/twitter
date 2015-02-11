# == Schema Information
#
# Table name: favourite_tweets
#
#  id         :integer          not null, primary key
#  tweet_id   :integer
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class FavouriteTweet < ActiveRecord::Base
    belongs_to :tweet
    belongs_to :user
end

