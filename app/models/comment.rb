class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  def update_comment_counter(counter)
    post.update(comments_counter: counter)
  end
end
