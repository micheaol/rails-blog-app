class LikesController < ApplicationController
    def create
      @post = Post.find(params[:post_id])
      @current_user = User.find(params[:user_id])
      new_like = Like.create(user_id: @current_user, post_id: @post)

      if new_like.save
        redirect_to user_posts_path(post.user.id, post.id), notice: 'Liked'
      else
        redirect_to user_posts_path(post.user.id, post.id), alert: 'Not liked!'
      end
    end
  end