# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :provide_post, only: %i[create destroy]

  def create
    @comment = Comment.new(comment_params)

    if @comment.save
      redirect_to @post
    else
      render 'posts/show'
    end
  end

  def destroy
    @comment = @post.comments.find(params[:id])
    @comment.destroy!

    redirect_to @post
  end

  private

  def provide_post
    @post = Post.find(params[:post_id])
  end

  def comment_params
    params.require(:comment).permit(:commenter, :body).merge(post: @post)
  end
end
