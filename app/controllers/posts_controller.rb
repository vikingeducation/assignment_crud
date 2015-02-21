class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def show
  end

  def create
    @post = Post.new(whitelisted_post_params)
    if @post.save
      redirect_to root_path
    else
      render :new
    end
  end

  private


  def whitelisted_post_params

  end
end
