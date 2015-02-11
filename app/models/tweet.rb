# == Schema Information
#
# Table name: tweets
#
#  id             :integer          not null, primary key
#  content        :text
#  tweet_location :string
#  user_id        :integer
#  in_reply_to_id :integer
#  created_at     :datetime
#  updated_at     :datetime
#

class Tweet < ActiveRecord::Base
    belongs_to :user
    belongs_to :original_tweet, :foreign_key => :original_tweet_id, :class_name => 'Tweet'    
  
    
    def is_news
        self.user.present? && self.user.is_news
    end

    def self.news
        Tweet.all.select { |t| t.is_news }
    end

    def mention(user)
         self.content.include? user.username
    end

    def self.mentions(user)
        Tweet.all.select { |t| t.mention(user) }
    end

    def is_following
        @current_user.following
    end

end


# when i have no self in is_news that method refers to a single tweet
#     but when i have self in the method name, that method refers to the class
#     which encapsulates all tweets
