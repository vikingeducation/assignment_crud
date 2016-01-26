class CrudsController < ApplicationController
  before_action :set_crud, only: [:show, :edit, :update, :destroy]

  def index
    @cruds = Crud.all
  end

  def new
    @crud = Crud.new
  end

  def create
    @crud = Crud.new(crud_params)

    if @crud.save
      redirect_to @crud, notice: "Created successfully."
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @crud.update(crud_params)
      redirect_to @crud, notice: "Updated successfully."
    else
      render :edit
    end
  end

  def destroy
    if @crud.destroy
      redirect_to cruds_path, notice: "Destroyed successfully."
    else
      render :edit
    end
  end

  private

  def set_crud
    @crud = Crud.find(params[:id])
  end

  def crud_params
    params.require(:crud).permit(:name)
  end
end
