class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(whitelist_params)
    @post.save
    redirect_to post_path(@post.id)
  end

  def show
    @post = Post.find(params[:id])
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(whitelist_params)
      redirect_to post_path(@post.id)
    else
      flash[:error] = "Did not update!"
      render :edit
    end
  end

private

  def whitelist_params
    params.require(:post).permit(:title, :body)
  end

end
