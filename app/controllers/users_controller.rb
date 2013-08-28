class UsersController < ApplicationController
  skip_before_filter :require_logged_in, :only => [:new, :create]
  def new
  end

  def create
    user = User.create!(params[:user])
    login_user(user)
    redirect_to feeds_url
  end
end
