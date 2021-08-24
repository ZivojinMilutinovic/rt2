class PrometDokumentasController < ApplicationController
    before_action :redirect_not_logged_user
    def index
        @promet_dokumenta=PrometDokumentas.where(user_id:[nil,current_user.id])
        @nazivi_kolona=PrometDokumentas::NAZIVI_KOLONA
        render :index
    end
    def new
        render :new
    end
    def create
        @promet_dokumenta=PrometDokumentas.new(promet_dokumenta_params)
        @promet_dokumenta.user=current_user;
        if @promet_dokumenta.save
            redirect_to "/promet_dokumentas"
        else
            flash.now[:errors]=@promet_dokumenta.errors.full_messages
            render :new
        end
    end
    def edit
        @promet_dokumenta=PrometDokumentas.find_by(id:params[:id])
        if @promet_dokumenta
            render :edit
        else
            redirect_to "/promet_dokumentas"
        end
    end
    def update
        @promet_dokumenta=PrometDokumentas.find_by(id:params[:id])
        if @promet_dokumenta.update(promet_dokumenta_params)
            redirect_to "/promet_dokumentas"
        else
            flash.now[:errors]=@promet_dokumenta.errors.full_messages
        end
    end
    def destroy
        @promet_dokumenta=PrometDokumentas.find_by(id:params[:id])
        @promet_dokumenta.destroy if @promet_dokumenta
        redirect_to "/promet_dokumentas"
    end
    private
    def promet_dokumenta_params
        params[:promet_dokumenta].permit(:nalog_gk,:dokument,:izdavalac_imenilac,:broj_oznaka_period,:datum_prometa,:iznos_bruto,:korekcija)
    end
end