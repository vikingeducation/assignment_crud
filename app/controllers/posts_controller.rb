class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def show
    @post = Post.find(params[:id])
  end

  def create
    @post = Post.new(whitelisted_post_params)
    if @post.save
      flash[:success] = "Post created!"
      redirect_to root_path
    else
      flash[:error] = "Post not created"
      render :new
    end
  end

  private


  def whitelisted_post_params
    params.require(:post).permit(:title, :author_name, :body)
  end
end
