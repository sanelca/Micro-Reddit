class PostsController < ApplicationController
  include PostsHelper

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
    @user = User.find(1)
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = params[:user_id]
    @post.save

    redirect_to user_path(@post.user)
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to :action => "index"
  end

  def edit
    @post = Post.find(params[:id])
  end
  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    redirect_to post_path(@post)
  end
  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
    @comment.user_id = 1
    @comment.post_id = @post.id
  end
end
