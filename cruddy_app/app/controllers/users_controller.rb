class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(whitelisted_user_params)
    if @user.save
      flash[:notice] = "Successfully created a new user!"
      redirect_to user_path(@user.id)
    else
      flash[:notice] = "Oh no! Something went wrong."
      redirect_to users_path
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update( whitelisted_user_params )
      flash[:notice] = "Successfully created a new user!"
      redirect_to user_path(@user.id)
    else
      flash[:notice] = "Oh no! Something went wrong."
      redirect_to users_path
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def index
    @users = User.all
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:notice] = "User destroyed!"
    redirect_to users_path
  end

  private

  def whitelisted_user_params
    params.require(:user).permit(:first_name, :last_name, :email)
  end

end
