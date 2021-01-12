class SessionsController < ApplicationController
  def new
    @user = User.new
    @users = User.all
  end

  def create
    @user = User.find_by(name: params[:user][:name])
    if @user && @user.authenticate(params[:user][:password])
      login(@user)
      redirect_to @user
    else
      @users = User.all
      render :new
    end
  end

  def destroy
    reset_session
    redirect_to root_path
  end
end
