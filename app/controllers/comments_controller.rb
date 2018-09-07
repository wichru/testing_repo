# frozen_string_literal: true

class CommentsController < ApplicationController
  def new; end

  def create
    @article = Post.find(params[:comment][:post_id])
    @comment = @article.comment.create(comment_params)

    redirect_to @article
  end

  private

  def comment_params
    params.require(:comment).permit(:commenter, :body)
  end
end
