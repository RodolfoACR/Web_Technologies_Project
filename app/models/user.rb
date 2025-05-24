class User < ApplicationRecord
    validates :email, presence: true, uniqueness: true
    validates :password, presence: true
    has_secure_password

    has_one :profile, dependent: :destroy
    accepts_nested_attributes_for :profile

    has_many :blocks_given, class_name: "Block", foreign_key: "blocker_id"
    has_many :blocked_users, through: :blocks_given, source: :blocked
    has_many :blocks_received, class_name: "Block", foreign_key: "blocked_id"
    has_many :blockers, through: :blocks_received, source: :blocker
    has_many :saved_posts
    has_many :favorite_posts, through: :saved_posts, source: :post

end
