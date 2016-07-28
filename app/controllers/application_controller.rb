class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user

  def home
  end


  def authenticate_user
    redirect_to new_session_path unless session[:user_id].present?
    current_user if session[:user_id].present?
  end

  def current_user
    return @current_user if defined?(@current_user)
    @current_user = User.find(session[:user_id])
  end
end
