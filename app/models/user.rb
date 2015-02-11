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
#  is_news         :boolean          default("false")
#  is_admin        :boolean          default("false")
#  created_at      :datetime
#  updated_at      :datetime
#

class User < ActiveRecord::Base

    # geocoded_by :address
    # after_validation :geocode

    mount_uploader :profile_pic, ProfilePicUploader

    has_secure_password

    has_many :tweets

    has_many :active_relationships, class_name:  "Relationship",
                                  foreign_key: "follower_id",
                                  dependent:   :destroy
    has_many :passive_relationships, class_name:  "Relationship",
                                   foreign_key: "followed_id",
                                   dependent:   :destroy

    has_many :following, through: :active_relationships, source: :followed
    has_many :followers, through: :passive_relationships, source: :follower

    validates :username, :presence => true, :uniqueness => true
    validates :email, :presence => true, :uniqueness => true

    # Follows a user.
    def follow(other_user)
    active_relationships.create(followed_id: other_user.id)
    end

    # Unfollows a user.
    def unfollow(other_user)
    active_relationships.find_by(followed_id: other_user.id).destroy
    end

    # Returns true if the current user is following the other user.
    def following?(other_user)
    following.include?(other_user)
    end

end

# Since destroying a user should also destroy that user’s relationships, 
# dependent: :destroy is added to the association
