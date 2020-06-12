class Post < ApplicationRecord
  has_many :likes
  has_many :users, through: :likes
  
def liked_by?(user)
  likes.where(user_id: user.id).exists?
end
end
