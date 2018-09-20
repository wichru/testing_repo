# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :find_post, only: %i[show edit update destroy]
  before_action :authenticate_user!, expect: %i[show index]

  def index
    @posts = Post.all.order(created_at: :desc)
                 .paginate(page: params[:page], per_page: 7)

    @posts = @posts.where('? = any(tags)', params[:q]) if params[:q].present?
  end

  def new
    @post = Post.new
  end

  def show
    @comment = Comment.new(post: @post, commenter: session[:commenter])
  end

  def edit; end

  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to posts_path
    else
      render 'new'
    end
  end

  def update
    if @post.update(post_params)
      redirect_to @post
    else
      render 'edit'
    end
  end

  def destroy
    @post.destroy
    respond_to do |format|
      format.js
      format.html { redirect_to posts_path, notice: 'User was successfully destroy.' }
      format.json { render json: @post, status: :ok, location: @post }
    end
    redirect_to posts_path
  end

  private

  def find_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :text, :tags)
  end
end
