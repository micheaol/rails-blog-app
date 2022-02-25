class LikesController < ApplicationController
  def create
    post = Post.find(params[:id])
    new_like = Like.create(user_id: current_user.id, post_id: post.id)

    if new_like.save
      flash[:notice] = 'Liked'
      redirect_to user_posts_path(post.user.id, post.id)
    else
      flash[:alert] ='Not liked!'
      redirect_to user_posts_path(post.user.id, post.id)
    end
  end
end
