class CrudsController < ApplicationController

def index
  @cruds = Crud.all
end

def new
  @crud = Crud.new 
end

def create
  
  redirect_to 
end

end
