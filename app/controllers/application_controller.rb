class ApplicationController < ActionController::Base
    def current_user
        return nil if session[:session_token].nil?
       @user||=User.find_by(session_token:session[:session_token]) 
    end
    def login!(user)
        @user=user
        session_token=user.reset_session_token!
        session[:session_token]=session_token
    end
end
