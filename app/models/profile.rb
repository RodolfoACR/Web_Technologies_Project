class Profile < ApplicationRecord
  belongs_to :user
  has_many :posts
  has_many :comments
  has_many :likes
  has_many :follower_relationships, class_name: "Follow", foreign_key: "followed_id"
  has_many :followers, through: :follower_relationships, source: :follower
  has_many :following_relationships, class_name: "Follow", foreign_key: "follower_id"
  has_many :following, through: :following_relationships, source: :followed


end
