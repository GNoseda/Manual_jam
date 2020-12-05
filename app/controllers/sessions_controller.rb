class SessionsController < ApplicationController
  skip_before_action :require_login
  
  def new
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_path, notice: "Log in successful"

    else
      flash.now[:notice] = "Email or Password incorrect"
      render action: :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: 'Log out successful'
  end
end
