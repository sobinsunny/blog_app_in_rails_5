class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def home
  end

  def authenticate_user
    redirect_to new_session_path unless session_id.present?
    current_user if session_id.present?
  end

  def current_user
    return @current_user if defined?(@current_user)
    @current_user = User.find(session_id)
  end

  def session_id
  	session[:user_id]
  end
end
