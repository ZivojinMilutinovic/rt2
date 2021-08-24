class UsersController < ApplicationController
    def new
        render :new
    end
    def create
        user=User.new(users_params)
        if user.save
            # msg=UserMailer.welcome_email(u)
            # msg.deliver_now
            login!(user)
            redirect_to '/'
        else
            flash.now[:errors]=user.errors.full_messages
            render :new
        end
    end
    private
    def users_params
        params[:user].permit(:username,:email,:password)
    end
end