class KittensController < ApplicationController

  def new
    @kitten = Kitten.new
  end


  def create
    @kitten = Kitten.new(kitten_params)

    if @kitten.save
      flash[:success] = "Woohoo, new kitten created!"
      redirect_to @kitten
    else
      flash.now[:warning] = "Whoops, something went wrong."
      render :new
    end
  end


  def show
    @kitten = Kitten.find(params[:id])
  end


  def index
    @kittens = Kitten.all
  end


  def edit
    @kitten = Kitten.find(params[:id])
  end


  def update
    @kitten = Kitten.find(params[:id])

    if @kitten.update(kitten_params)
      flash[:success] = "Smooooooth, kitten updated!"
      redirect_to @kitten
    else
      flash.now[:warning] = "Oops, something didn't work."
      render :edit
    end    
  end


  def destroy
    @kitten = Kitten.find(params[:id])
    @kitten.destroy
    flash[:warning] = "How dare you!  Kitten DESTROYED!"
    redirect_to kittens_path
  end


  private


  def kitten_params
    params.require(:kitten).permit(:name, :bio)
  end

end
