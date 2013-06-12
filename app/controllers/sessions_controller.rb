class SessionsController < ApplicationController
  def create
    user = User.find_by_username(params[:username])  
    if user && user.verify_password(params[:password])
      session[:token] = user.generate_session_token! 
      flash[:success] = "Sign in successful"
      redirect_to user_path(user)
    else
      flash[:error] = "Password failed"
      redirect_to :back
    end
  end
  
  def destroy
    @current_user.token = nil 
    @current_user.save!
    session[:token] = nil 
  end
  
end
