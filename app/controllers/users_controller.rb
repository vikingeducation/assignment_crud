class UsersController < ApplicationController
	def index
		@users = User.all
	end

	def show
		@user = User.find(params[:id])
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new
		@user.first_name = params[:user][:first_name]
		@user.last_name = params[:user][:last_name]
		@user.bio = params[:user][:bio]
		if @user.save
			redirect_to user_path(@user)
		else
			:new
		end
	end
end
