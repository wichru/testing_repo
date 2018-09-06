class PostsController < ApplicationController
  before_action :find_article, only: [:show, :edit, :update]
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def show; end

  def edit; end

  def update
    if @post.update(post_params)
      redirect_to @post
    else
      render 'edit'
    end
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to posts_path
    else
      render 'new'
    end
  end

  private

  def find_article
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
