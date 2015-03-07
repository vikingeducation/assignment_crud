class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post=Post.find(params[:id])
    @posts=Post.all
  end

  def new
    @post = Post.new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:success] = "#{@post.title} created!"
      redirect_to :action => :index
    else
      flash.now[:error] = "error; try again!"
      render 'new'
    end
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      flash[:success] = "Updated!"
      redirect_to @post
    else
      flash.now[:error] = "Error; try again!"
      render 'edit'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash.now[:notice] = "post was destroyed"
    redirect_to @post
  end

  def post_params
    params.require(:post)
    .permit(:title, :body)
  end
end

