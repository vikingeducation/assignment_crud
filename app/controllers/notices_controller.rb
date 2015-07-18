class NoticesController < ApplicationController
  def index
    @notices = Notice.all
  end

  def new
    @notice = Notice.new
  end

  def create
    @notice = Notice.new(whitelist_notice_params)
    if @notice.save
      flash[:notice] = "Notice #{@notice.title} successfully created!"
      redirect_to notices_path
    else
      flash[:notice] = "Notice #{@notice.title} has errors. Please fix them."
      render :new
    end
  end

  def show
    @notice = Notice.find(params[:id])
  end

  def edit
    @notice = Notice.find(params[:id])
  end

  def update
    @notice = Notice.find(params[:id])
    if @notice.update(whitelist_notice_params)
      flash[:notice] = "Notice #{@notice.title} successfully updated!"
      redirect_to @notice
    else
      flash[:notice] = "Notice #{@notice.title} has illegal entries. Please resubmit the form."
      redirect_to edit_notice_path(@notice)
    end

  end

  def destroy
    @notice = Notice.find(params[:id])
    if @notice.destroy
      flash[:notice] = "Notice #{@notice.title} has been deleted."
    else
      flash[:notice] = "Notice #{@notice.title} could not be destroyed at this time."
    end
    redirect_to notices_path
  end

  private

  def whitelist_notice_params
    params.require(:notice).permit(:title, :body)
  end
end
