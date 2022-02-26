class UsersController < ApplicationController
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

  private
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
