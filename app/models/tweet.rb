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
    
end
