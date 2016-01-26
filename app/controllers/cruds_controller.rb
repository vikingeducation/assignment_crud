class CrudsController < ApplicationController

  def index
    @cruds = Crud.all
  end


  def new
    @crud = Crud.new
  end

  def create
    @crud = Crud.new(crud_params)
    @crud.save
    flash[:success] = "New CRUD #{@crud.title} has been crud-ed!"

    redirect_to crud_path(@crud)
  end


  def show
    @crud = Crud.find(params[:id])
  end


  def edit
    @crud = Crud.find(params[:id])
  end


  def update
    @crud = Crud.find(params[:id])
    @crud.update(crud_params)
    flash[:success] = "New CRUD #{@crud.title} has been saved!"

    redirect_to crud_path(@crud)
  end


  def destroy
    @crud = Crud.find(params[:id])
    @crud.destroy
    flash[:success] = "CRUD #{@crud.title} has been deleted!"

    redirect_to cruds_path
  end






  private

  def crud_params
    params.require(:crud).permit(:title,:body)
  end


end
