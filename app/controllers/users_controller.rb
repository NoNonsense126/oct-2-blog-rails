class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:new, :create]
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to login_path
    else
      render :new
    end
  end

  private
    def user_params
      params.require(:user).permit(:email, :username, :password,
        :password_confirmation)
    end
end