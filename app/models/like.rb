class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post

  def update_likes_counter(counter)
    post.update('likes_counter', counter)
  end
end
