class Like < ApplicationRecord
    belongs_to :user
    belongs_to :post

    def update_like_counter(counter)
        likes.update('likes_counter', counter)
    end
end