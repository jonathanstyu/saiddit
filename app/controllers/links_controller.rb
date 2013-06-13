class LinksController < ApplicationController
  before_filter :user_logged_in
  
  def new
    @link = Link.new
    @comment = @link.comments.build(commenter_id: @current_user.id)
  end
  
  def show
    @link = Link.find(params[:id])
  end
  
  def create
    @link = @current_user.submitted_links.build(params[:link])
    if @link.save
      flash[:success] = "Save Worked"
      redirect_to link_path(@link)
    else
      flash[:error] = "Save did not work."
      render :new
    end
  end
  
  def upvote
    @current_user.votes.create(link_id: params[:link_id], vote_value: "up")
    redirect_to :back
  end
  
  def downvote
    @current_user.votes.create(link_id: params[:link_id], vote_value: "down")
    redirect_to :back
  end
  
  private
  def user_logged_in
    unless @current_user
      flash[:error] = "Please Log In"
      redirect_to new_session_path
    end
  end
end
