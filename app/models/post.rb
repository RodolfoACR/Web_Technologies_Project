class Post < ApplicationRecord
  belongs_to :profile
  has_many :comments, dependent: :destroy
  has_many :likes, as: :likeable, dependent: :destroy
  has_many :post_hashtags, dependent: :destroy
  has_many :hashtags, through: :post_hashtags
  has_many :saved_posts, dependent: :destroy
  has_many :saved_by_users, through: :saved_posts, source: :user
  validates :image_url, presence: true
  validates :description, presence: true, length: { maximum: 500 }
end
