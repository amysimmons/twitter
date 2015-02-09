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
    
    def is_news
        self.user.present? && self.user.is_news
    end

    def self.news
        Tweet.all.select { |t| t.is_news }
    end

    def mention
        self.content.include? @current_user.username
    end

    def self.mentions

    end
end


# when i have no self in is_news that method refers to a single tweets
#     but when i have self in the method name, that method refers to the class
#     which encapsulates all tweets