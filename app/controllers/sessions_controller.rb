class SessionsController < ApplicationController
  skip_before_action :authenticate_user!

  def new
  end

  def create
    @user = User.find_by(username: params[:username])
    if @user.nil?
      sleep rand(200..300) / 1000.0
      flash.now.alert = 'Username or password is invalid'
      render :new
    elsif @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to root_path, notice: 'Logged in.'
    else
      flash.now.alert = 'Username or password is invalid'
      render :new
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to root_path, notice: 'Logged out.'
  end
end
