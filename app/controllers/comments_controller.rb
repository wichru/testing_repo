# frozen_string_literal: true

class CommentsController < ApplicationController
  def new; end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comment.create(comment_params)

    redirect_to @post
  end

  private

  def comment_params
    params.require(:comment).permit(:commenter, :body)
  end
end
