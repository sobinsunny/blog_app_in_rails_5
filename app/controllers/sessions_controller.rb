class SessionsController < ApplicationController
  def new
    build_sign_in
  end

  def create
    build_sign_in
    if @user_sign_in.save
      set_user_session
      flash[:success] = 'Successfully Logined'
      redirect_to dashbord_user_path(@user)
    else
      flash[:error] = 'Error in login'
      render :new
    end
  end

  def destroy
    @current_user = session[:user_id] = nil
    redirect_to new_session_path
  end

  private

  def build_sign_in
    @user_sign_in = User::SignIn.new(sign_in_params)
  end

  def set_user_session
    session[:user_id] = user.id
  end

  def user
    @user ||= User.find_by_email(sign_in_params[:email])
  end

  def sign_in_params
    sign_in_params = params[:user_sign_in]
    sign_in_params.permit(:email, :password) if sign_in_params.present?
  end
end
