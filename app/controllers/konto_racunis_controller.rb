class KontoRacunisController < ApplicationController
    before_action :redirect_not_logged_user
    def index
        @konto_racuni=Konto5Racuni.where(user_id:[nil,current_user.id])
        @nazivi_kolona=Konto5Racuni::NAZIVI_KOLONA
        render :index
    end
    def new
        render :new
    end
    def create
        @racun=Konto5Racuni.new(racun_params)
        @racun.user=current_user
        if @racun.save
            redirect_to "/konto_racunis"
        else
            flash.now[:errors]=@racun.errors.full_messages
            render :new
        end
    end
    def edit
        @racun=Konto5Racuni.find_by(id:params[:id])
        if @racun
            render :edit
        else
            redirect_to "/konto_racunis"
        end
    end
    def update
        @racun=Konto5Racuni.find_by(id:params[:id])
        if @racun.update(racun_params)
            redirect_to "/konto_racunis"
        else
            flash.now[:errors]=@racun.errors.full_messages
        end
    end
    def destroy
        @racun=Konto5Racuni.find_by(id:params[:id])
        @racun.destroy if @racun
        redirect_to "/konto_racunis"
    end
    private
    def racun_params
        params[:racun].permit(:naziv,:konto4_objekti_prometa_id,:analitika,:pozicija_ks_ispravka)
    end
    
end