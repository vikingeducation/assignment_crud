class UsersController < ApplicationController
	include UsersHelper

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
		@user = User.new(user_params)
		if @user.save
			flash.notice = "User '#{@user.first_name} #{@user.last_name}' Created!"
			redirect_to user_path(@user)
		else
			:new
		end
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		@user.update(user_params)

		flash.notice = "User '#{@user.first_name} #{@user.last_name}' Updated!"

		redirect_to user_path(@user)
	end

	def destroy
		@user = User.find(params[:id])
		@user.destroy

		flash.notice = "User '#{@user.first_name} #{@user.last_name}' Deleted!"

		redirect_to users_path
	end
end
