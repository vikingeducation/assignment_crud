class RobotsController < ApplicationController
	before_action :set_robot, :only => [:show, :edit, :update, :destroy]

	def index
		@robots = Robot.all
	end

	def show
	end

	def new
		@robot = Robot.new
	end

	def edit
	end

	def create
		@robot = Robot.new(robot_params)
		if @robot.save
			flash[:success] = 'Robot created!'
			redirect_to @robot
		else
			flash.now[:error] = 'Error: robot not created'
			render :new
		end
	end

	def update
		if @robot.update_attributes(robot_params)
			flash[:success] = 'Robot updated!'
			redirect_to @robot
		else
			flash.now[:error] = 'Error: robot not updated'
			render :edit
		end
	end

	def destroy
		@robot.destroy
		flash[:success] = 'Robot deleted!'
		redirect_to robots_path
	end

	private
		def set_robot
			@robot = Robot.find(params[:id])
		end

		def robot_params
			params.require(:robot).permit(:name, :story)
		end
end
