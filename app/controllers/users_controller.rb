class UsersController < ApplicationRecord
    def new
        render :new
    end
    def create
        user=User.new(users_params)
        if user.save
            login!(user)
            redirect_to '/'
        else
            flash.now[:errors]=user.errors.full_messages
            render :new
        end
    end
    def users_params
        params[:user].permit(:username,:email,:password)
    end
end