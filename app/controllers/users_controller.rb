class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params_hash)
    if @user.save
      flash[:success] = "User #{@user.username} successfully created!"
      redirect_to user_path(@user)
    else
      flash[:error] = "User could not be created"
      redirect_to new_user
    end
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
    flash[:success] = "User #{@user.username} was updated!"
    redirect_to user_path(@user)
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:success] = "User #{@user.username} was successfully deleted"
    redirect_to users_path
  end

  private

  def params_hash
    params.require(:user).permit(:username, :email, :password)
  end


end
