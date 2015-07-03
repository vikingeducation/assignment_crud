class NotesController < ApplicationController

  def new
    @note = Note.new
    render :new
  end


  def create
    @note = Note.new(whitelisted_params)

    if @note.save
      # flash success
      redirect_to note_path(@note.id)
    else
      # flash warning
      render :new
    end


    def show
      @note = Note.find(params[:id])
    end

  end



  private


  def whitelisted_params
    params.require(:note).permit(:category, :body)
  end


end
