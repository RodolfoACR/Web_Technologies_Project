class Profile < ApplicationRecord
  before_validation :set_default_avatar, on: :create
  validates :username, presence: true, uniqueness: true
  belongs_to :user
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :follower_relationships, 
           class_name: "Follow", 
           foreign_key: "followed_id", 
           dependent: :destroy
  has_many :followers, 
           through: :follower_relationships, 
           source: :follower
  has_many :following_relationships, 
           class_name: "Follow", 
           foreign_key: "follower_id", 
           dependent: :destroy
  has_many :following, 
           through: :following_relationships, 
           source: :followed
  def set_default_avatar
    if self.avatar_url.blank?
      self.avatar_url = "https://img.freepik.com/free-vector/blue-circle-with-white-user_78370-4707.jpg?ga=GA1.1.1991389944.1748048473&semt=ais_hybrid&w=740"
    end
end
