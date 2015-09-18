class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.find_by(name: params[:name])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user.id)
    else
      redirect_to root_path
    end
  end

  private 

  def user_params
    params.require(:user).permit(:name, :password)
  end

end