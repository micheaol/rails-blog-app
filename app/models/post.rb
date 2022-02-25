class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :likes

  validates :title, presence: true,
  length: { maximum: 250, too_long: 'must not exceed 250 characters' }
  validates :comments_counter, :likes_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def update_post_counter(counter)
    user.update(post_counter: counter)
  end

  def most_recent_comment(limit = 5)
    comments.order(created_at: :desc).limit(limit)
  end
end
