class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :profile
  has_many :likes, as: :likeable, dependent: :destroy
  validates :body, presence: true
end
