class UsersController < ApplicationController
  def index
  end

  def show
  end

  def create
    build_user
    if @user.save
      flash[:sucess] = 'Successfully Created'
      redirect_to home_path
    else
      render :new
    end
  end

  def update
  end

  def edit
  end

  def destroy
  end

  def new
    build_user
  end

  private

  def build_user
    @user ||= User::SignUp.new(user_parameters)
  end

  def user_parameters
    user_params = params[:user]
    user_params.permit(:email, :name, :password, :password_confirmation) if user_params.present?
  end
end
