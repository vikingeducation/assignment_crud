class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    # we just need to pass it in the variabel with the id
    @task = Task.find(params[:id])
  end
end
