class PostsController < ApplicationController
  load_and_authorize_resource
  skip_authorize_resource only: :all_posts
  
  def index
    @user = User.find(params[:user_id])
    @posts = @user.recent_posts
  end

  def show
    @user = User.find(params[:id])
    @post = @user.posts.find(params[:user_id])
    @comments = @post.comments.all
  end

  def new
    @post = Post.new
  end

  def create
    @current_user = User.find(params[:user_id])
    @new_post = Post.new(user: @current_user, title: params[:post][:title], text: params[:post][:text])

    if @new_post.save
      flash[:notice] = 'Post created successfully!!!'
      redirect_to user_posts_path(@new_post.user.id)
    else
      flash[:notice] = 'Opp! some went wrong!!'
      render :new
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
