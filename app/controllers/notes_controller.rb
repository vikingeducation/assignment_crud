class NotesController < ApplicationController

  def new
    @note = Note.new
    render :new
  end


end
