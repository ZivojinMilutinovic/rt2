class RobasController < ApplicationController
    before_action :redirect_not_logged_user
    def index
        @roba=Robas.where(user_id:[nil,current_user.id])
        @nazivi_kolona=Robas::NAZIVI_KOLONA
        render :index
    end
    def new
        render :new
    end
    def create
        @roba=Robas.new(roba_params)
        @roba.user=current_user
        if @roba.save
            redirect_to "/robas"
        else
            flash.now[:errors]=@roba.errors.full_messages
            render :new
        end
    end
    def edit
        @roba=Robas.find_by(id:params[:id])
        if @roba
            render :edit
        else
            redirect_to "/robas"
        end
    end
    def update
        @roba=Robas.find_by(id:params[:id])
        if @roba.update(roba_params)
            redirect_to "/robas"
        else
            flash.now[:errors]=@roba.errors.full_messages
        end
    end
    def destroy
        @roba=Robas.find_by(id:params[:id])
        @roba.destroy if @roba
        redirect_to "/robas"
    end
    private
    def roba_params
        params[:roba].permit(:naziv,:analitika_racuna_id,:sifra,:oznaka,:kat_broj,:jedinica_mere,:poreska_tarifa,:pakovanje)
    end
end