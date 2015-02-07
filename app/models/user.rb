# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string
#  email           :string
#  username        :string
#  password_digest :string
#  bio             :text
#  organisation    :string
#  user_location   :string
#  profile_pic     :text
#  is_news         :boolean
#  is_admin        :boolean
#  created_at      :datetime
#  updated_at      :datetime
#

class User < ActiveRecord::Base

    has_secure_password

    has_many :tweets

    has_many :active_relationships, class_name:  "Relationship",
                                  foreign_key: "follower_id",
                                  dependent:   :destroy

    has_many :following, through: :active_relationships, source: :followed

    validates :username, :presence => true, :uniqueness => true
    validates :email, :presence => true, :uniqueness => true
end

# Since destroying a user should also destroy that user’s relationships, 
# dependent: :destroy is added to the association
