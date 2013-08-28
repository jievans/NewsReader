class SessionsController < ApplicationController
  skip_before_filter :require_logged_in, :except => [:destroy]

  def new

  end

  def create
    user = User.find_by_username(params[:username])
    if user.password_equals?(params[:password])
      login_user(user)
      redirect_to feeds_url
    else
      flash[:notice] = "Credentials not correct"
      redirect_to new_session_url
    end
  end

  def destroy
    logout
    redirect_to new_session_url
  end
end
