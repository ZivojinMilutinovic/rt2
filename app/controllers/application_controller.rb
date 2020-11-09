class ApplicationController < ActionController::Base
    helper_method :current_user
    def current_user
        return nil if session[:session_token].nil?
       @user||=User.find_by(session_token:session[:session_token]) 
    end
    def login!(user)
        session_token=user.reset_session_token!
        session[:session_token]=session_token
        @user=user
    end
    def redirect_not_logged_user
        redirect_to  new_session_url  if current_user.nil?
    end
end
