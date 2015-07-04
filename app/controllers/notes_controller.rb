class NotesController < ApplicationController

  def index
    @notes = Note.all
  end


  def show
    @note = Note.find(params[:id])
  end


  def new
    @note = Note.new
  end


  def create
    @note = Note.new(whitelisted_params)

    if @note.save
      flash[:success] = "Note saved!"
      redirect_to @note
    else
      flash[:warning] = "Save failed! Try again."
      render :new
    end
  end


  def edit
    @note = Note.find(params[:id])
  end


  def update
    @note = Note.find(params[:id])

    if @note.update(whitelisted_params)
      flash[:success] = "Note updated!"
      redirect_to @note
    else
      flash[:warning] = "Update failed! Try again."
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
