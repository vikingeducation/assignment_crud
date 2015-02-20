class DogsController < ApplicationController

  def index
    @dogs = Dog.all
  end

  def new
    @dog = Dog.new
  end

  def create
    @dog = Dog.new(doggy_params)
    if @dog.save
      flash[:success] = "Woof! That's a new dog."
      redirect_to dog_path(@dog.id)
    else
      flash[:error] = "That dog was not saved."
      render :new
    end
  end

  def show
    @dog = Dog.find(params[:id])
  end

  def edit
    @dog = Dog.find(params[:id])
  end

  def update
    @dog = Dog.find(params[:id])
    if @dog.update(doggy_params)
      flash[:success] = "Dog updated."
      redirect_to dog_path(@dog)
    else
      flash[:error] = "That dog was not updated. Try again."
      render :edit
    end
  end

  def destroy
    @dog = Dog.find(params[:id])
    @dog.delete

    flash[:success] = "That doggy is dunzo."
    redirect_to dogs_path
  end

  private

  def doggy_params
    params.require(:dog).permit(:breed,:description)
  end
end
