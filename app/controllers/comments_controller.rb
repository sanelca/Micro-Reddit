class CommentsController < ApplicationController


  include CommentsHelper
  def create
    @comment = Comment.new(comment_params)
    #Harcoded user_id is simulation of logged user
    @comment.user_id = 1
    @comment.post_id = params[:post_id]

    @comment.save
    redirect_to post_path(@comment.post)
  end
end
