class DogsController < ApplicationController
  before_action :set_dog, only: [:edit, :update, :destroy, :show]

  def show
  end

  def new
    @dog = Dog.new
  end

  def create
    @dog = Dog.new(dog_params)

    if @dog.save
      flash[:notice] = "Dog successfully created!"
      redirect_to @dog
    else
      flash[:error] = "Hmm, something went wrong. Try again."
      redirect_to :new
    end
  end

  def index
    @dogs = Dog.all
  end

  def edit
  end

  private

  def set_dog
    @dog = Dog.find(params[:id])
  end

  def dog_params
    params.require(:dog).permit(:name, :breed, :age)
  end
end
