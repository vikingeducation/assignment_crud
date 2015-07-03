class NotesController < ApplicationController

  def index
    @notes = Note.all
  end


  def new
    @note = Note.new
  end


  def create
    @note = Note.new(whitelisted_params)

    if @note.save
      # flash success
      redirect_to @note
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
  end


  def update
    @note = Note.find(params[:id])

    if @note.update(whitelisted_params)
      # flash success
      redirect_to @note
    else
      # flash warning
      render :edit
    end
  end


  def destroy
    @note = Note.find(params[:id]).destroy!
    redirect_to notes_path
  end



  private


  def whitelisted_params
    params.require(:note).permit(:category, :body)
  end


end
