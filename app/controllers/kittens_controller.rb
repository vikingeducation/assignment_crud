require 'kitten_url'

class KittensController < ApplicationController

  def new
    @kitten = Kitten.new
  end


  def create
    @kitten = Kitten.new(kitten_params)
    @kitten.picture = KittenUrl::get_image
    if @kitten.save
      redirect_to @kitten
    else
      render :new
    end
  end


  private


  def kitten_params
    params.require(:kitten).permit(:name, :bio)
  end

end
