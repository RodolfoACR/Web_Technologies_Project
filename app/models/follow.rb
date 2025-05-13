class Follow < ApplicationRecord
  belongs_to :follower
  belongs_to :followed
  belongs_to :follower, class_name: "Profile"
  belongs_to :followed, class_name: "Profile"
end
