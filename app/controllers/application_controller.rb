class ApplicationController < ActionController::Base
    helper_method :current_user, :logged_in?
  
    private
  
    def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end
  
    def logged_in?
      !!current_user
    end
  
    def require_user
      redirect_to login_path, alert: 'You must be logged in to perform this action' unless logged_in?
    end
end
  