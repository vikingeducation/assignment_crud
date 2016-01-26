class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new
    @user.last_name = params[:last_name]
    @user.first_name = params[:first_name]
    @user.email = params[:email]
  end

  def edit

  end

  def update

  end

  def show

  end

  def index
    @users = User.all
  end

  def destroy

  end
end
