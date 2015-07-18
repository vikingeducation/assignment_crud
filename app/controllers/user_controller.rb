class UserController < ApplicationController

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:username], params[:email], params[:password])
    @user.save
    redirect_to user_path(@user)
  end

  def show
    @user = User.find(params[:id])
  end

  def edit

  end

  def update

  end

  def destroy

  end
end
