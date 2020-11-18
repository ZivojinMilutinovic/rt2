class TipRobesController < ApplicationController
    before_action :redirect_not_logged_user
    def index
        @roba=TipRobe.where(user_id:[nil,current_user.id])
        @nazivi_kolona=TipRobe::NAZIVI_KOLONA
        render :index
    end
    def new
        render :new
    end
    def create
        @roba=TipRobe.new(roba_params)
        @roba.user=current_user
        if @roba.save
            redirect_to "/tip_robes"
        else
            flash.now[:errors]=@roba.errors.full_messages
            render :new
        end
    end
    def edit
        @roba=TipRobe.find_by(id:params[:id])
        if @roba
            render :edit
        else
            redirect_to "/tip_robes"
        end
    end
    def update
        @roba=TipRobe.find_by(id:params[:id])
        if @roba.update(roba_params)
            redirect_to "/tip_robes"
        else
            flash.now[:errors]=@roba.errors.full_messages
        end
    end
    def destroy
        @roba=TipRobe.find_by(id:params[:id])
        @roba.destroy if @roba
        redirect_to "/tip_robes"
    end
    private
    def roba_params
        params[:roba].permit(:naziv,:oznaka)
    end

end