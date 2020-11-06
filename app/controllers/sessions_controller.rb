class SessionsController < ApplicationController
    def new
        render :new
    end
    def create
        user=User.find_by_credientials(params[:user][:username],params[:user][:password])
        if user
            login!(user)
            redirect_to "/"
        else
            flash.now[:errors]=["Korisnik nije pronadjen"]
            render :new
        end
        
    end
    def destroy
        current_user.reset_session_token!
        session[:session_token]=nil
        redirect_to "/"
    end
end