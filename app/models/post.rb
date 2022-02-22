class Post < ApplicationRecord
    belongs_to :user
    has_many :comments
    has_many :likes

    def update_post_counter(counter)
        user.update('post_counter', counter)
    end

    def most_recent_comment(limit = 5)
        comments.order(created_at: :desc).limit(limit)
    end
end