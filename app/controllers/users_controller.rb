class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params_hash)
    @user.save
    redirect_to user_path(@user)
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(params_hash)
    redirect_to user_path(@user)
  end

  def destroy

  end

  private

  def params_hash
    params.require(:user).permit(:username, :email, :password)
  end


end
