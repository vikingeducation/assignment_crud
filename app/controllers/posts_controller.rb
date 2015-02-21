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

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(whitelisted_post_params)
      flash[:success] = "Post updated!"
      redirect_to root_path
    else
      flash[:error] = "Post not updated"
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    if @post.destroy
      flash[:success] = "Post destroyed you jerk"
      redirect_to root_path
    else
      flash[:error] = "Post not destroyed"
      render :show
    end
  end

  private


  def whitelisted_post_params
    params.require(:post).permit(:title, :author_name, :body)
  end
end
