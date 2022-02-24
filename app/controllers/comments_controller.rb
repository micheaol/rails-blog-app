class CommentsController < ApplicationController

  def new
    @comment = Comment.new
  end
    def create
        post = Post.find(params[:id])
        new_comment = Comment.create(user_id: current_user.id, post_id: post.id, text: comment_params[:text])
        if new_comment.save
            flash[:notice] = "Comment added successfully"
          redirect_to user_post_path(post.user.id, post.id)
        else
            flash[:alert] = 'Failed to add comment!'
          redirect_to user_post_path(post.user.id, post.id)
        end
      end
    
      private
    
      def comment_params
        params.require(:data).permit(:text)
      end
end
