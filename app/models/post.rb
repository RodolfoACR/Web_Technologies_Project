class Post < ApplicationRecord
  belongs_to :profile  
  has_many :comments
  has_many :post_hashtags
  has_many :hashtags, through: :post_hashtags
  has_many :likes, as: :likeable
  has_many :saved_posts
  has_many :saved_by_users, through: :saved_posts, source: :user
  validates :image_url, presence: true
  validates :description, presence: true, length: { maximum: 500 }
  
  

end
