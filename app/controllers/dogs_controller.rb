class DogsController < ApplicationController
  def new
  end

  def index
    @dogs = Dog.all
  end

  def edit
  end
end
