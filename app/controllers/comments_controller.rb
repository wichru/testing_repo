# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :provide_post, only: %i[create destroy]

  def create
    @comment = @post.comments.create(comment_params)

    redirect_to @post
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
    params.require(:comment).permit(:commenter, :body)
  end
end
