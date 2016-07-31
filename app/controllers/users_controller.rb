class UsersController < ApplicationController
  before_action :authenticate_user, except: [:new, :create]

  def index
    @users = User.all
  end

  def show
  end

  def create
    build_user
    if @user.save
      flash[:success] = 'Successfully Created'
      redirect_to login_path
    else
      flash[:error] = 'Error'
      render :new
    end
  end

  def dashbord
   @user= User.find(params[:id])
   @posts = @user.posts
  end

  def update
  end

  def edit
    set_user
  end

  def destroy
  end

  def new
    build_user
  end

  private

  def set_user
  end

  def build_user
    @user ||= User::SignUp.new(user_parameters)
  end

  def user_parameters
    user_params = params[:user]
    user_params.permit(:email, :name, :password, :password_confirmation) if user_params.present?
  end
end
