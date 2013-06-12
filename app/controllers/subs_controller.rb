class SubsController < ApplicationController
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

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @sub }
    end
  end

  # GET /subs/1/edit
  def edit
    # Makes sure that someone cannot create a 
    if @current_user.id 
      @sub = Sub.find(params[:id])
      render :edit
    else
      flash[:error] = "You cannot edit this sub because you are not the moderator"
      redirect_to user_path(@current_user)
    end
  end

  # POST /subs
  # POST /subs.json
  def create
    @sub = Sub.new(params[:sub])

    respond_to do |format|
      if @sub.save
        format.html { redirect_to @sub, notice: 'Sub was successfully created.' }
        format.json { render json: @sub, status: :created, location: @sub }
      else
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
    @sub = Sub.find(params[:id])
    @sub.destroy

    respond_to do |format|
      format.html { redirect_to subs_url }
      format.json { head :no_content }
    end
  end
end
