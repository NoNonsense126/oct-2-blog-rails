class SessionsController < ApplicationController
  before_action :authenticate_user!, only: []
  def new
  end

  def create
    @user = User.find_by(email: params[:session][:email])
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      flash[:success] = "You have successfully signed in"
      redirect_to root_path
    else
      redirect_to login_path, notice: "Invalid email or password"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end