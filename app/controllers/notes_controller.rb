class NotesController < ApplicationController

  def new
    @note = Note.new
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
  end


  def show
    @note = Note.find(params[:id])
  end


  def edit
    @note = Note.find(params[:id])
    render :new
  end


  def update
    @note = Note.new(whitelisted_params)

    if @note.save
      # flash success
      redirect_to note_path(@note.id)
    else
      # flash warning
      render :new
    end
  end


  def index
    @notes = Note.all
  end



  private


  def whitelisted_params
    params.require(:note).permit(:category, :body)
  end


end
