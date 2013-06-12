class LinksController < ApplicationController
  before_filter :user_logged_in
  def new
    @link = Link.new
  end
  
  def show
    @link = Link.find(params[:id])
  end
  
  def create
    @link = Link.new(params[:link])
    @link.submitter_id = @current_user.id 
    if @link.save
      flash[:success] = "Save Worked"
      redirect_to link_path(@link)
    else
      flash[:error] = "Save did not work."
      render :new
    end
  end
  
  private
  def user_logged_in
    unless @current_user
      flash[:error] = "Please Log In"
      redirect_to new_session_path
    end
  end
end
