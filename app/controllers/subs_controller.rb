class SubsController < ApplicationController
  before_filter :check_admin, :only => [:destroy, :edit]
  before_filter :user_logged_in, :only => [:new]
  # GET /subs
  # GET /subs.json
  def index
    @subs = Sub.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @subs }
    end
  end

  # GET /subs/1
  # GET /subs/1.json
  def show
    @sub = Sub.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @sub }
    end
  end

  # GET /subs/new
  # GET /subs/new.json
  def new
    @sub = Sub.new
    5.times {@sub.links.build(submitter_id: @current_user.id)}
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @sub }
    end
  end

  # GET /subs/1/edit
  def edit
    render :edit
  end

  # POST /subs
  # POST /subs.json
  def create
    @sub = @current_user.moderating_subs.build(params[:sub])

    respond_to do |format|
      if @sub.save
        format.html { redirect_to @sub, notice: 'Sub was successfully created.' }
        format.json { render json: @sub, status: :created, location: @sub }
      else
        flash[:error] = "There was an error #{@sub.errors.messages}"
        format.html { render action: "new" }
        format.json { render json: @sub.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /subs/1
  # PUT /subs/1.json
  def update
    @sub = Sub.find(params[:id])

    respond_to do |format|
      if @sub.update_attributes(params[:sub])
        format.html { redirect_to @sub, notice: 'Sub was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @sub.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /subs/1
  # DELETE /subs/1.json
  def destroy
    @sub.destroy
  end
  
  private
  
  def check_admin
    @sub = Sub.find(params[:id])
    # Makes sure that someone cannot edit/destroy a subs page
    unless @current_user && @current_user.id == @sub.moderator_id
      flash[:error] = "You cannot edit or delete this sub because you are not the moderator"
      redirect_to :back
    end
  end
  
  def user_logged_in
    unless @current_user
      flash[:error] = "Please Log In"
      redirect_to new_session_path
    end
  end
  
end
