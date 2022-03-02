class UsersController < ApplicationController
  before_action :logged_in_user, only: [:edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update]
  before_action :admin_user, only: :destroy

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.invalid?
      flash[:success] = "Invalid Data"
      redirect_to new_user_path
    else
      flash[:success] = "Welcome to sample app"
      log_in @user
      @user.save
      redirect_to @user
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = "Your data updated successfully"
      redirect_to @user
    else
      render 'edit'

    end
  end

  def destroy
    
    @user = User.find(params[:id])
    @user.destroy
    flash[:success]="User deleted successfully"
    redirect_to users_path
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

    def logged_in_user
      unless logged_in?
        flash[:danger] = 'Please log in'
        redirect_to login_url
      end
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user == @user
    end

    def admin_user
      redirect_to root_url unless current_user.admin?
    end
end
