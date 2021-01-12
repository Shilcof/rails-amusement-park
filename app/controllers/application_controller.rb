class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end
  
  helper_method :current_user

  def login(user)
    session[:user_id] = user.id
  end

  def redirect_if_not_logged_in
    return redirect_to root_path unless current_user
  end

  def redirect_if_not_admin
    return redirect_to root_path unless current_user.admin
  end
end
