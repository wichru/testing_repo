class PostsController < ApplicationController
  def index

  end

  def new
  end

  def create
    post_params = params.require(:post).permit(:title, :text)

  end

  def edit; end

  def show; end

end
