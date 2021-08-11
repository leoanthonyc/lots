class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  helper_method :current_user, :signed_in?

  private

  def authenticate_user!
    return if signed_in?

    redirect_to new_session_path, alert: 'You must sign in first.'
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def signed_in?
    current_user.present?
  end
end
