class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
  helper_method :current_user
  before_action :login_required,except: [:home, :new, :user_profile] 

  private

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def login_required
    redirect_to "/" unless current_user
  end
  
end
