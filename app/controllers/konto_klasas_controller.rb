class KontoKlasasController < ApplicationController
    before_action :redirect_not_logged_user
    def index
        @konto_klase=Konto1Klasa.where(user_id:[nil,current_user.id])
        @nazivi_kolona=Konto1Klasa::NAZIVI_KOLONA;
        render :index
    end
    def new
        render :new
    end
    def create
        @klasa=Konto1Klasa.new(klasa_params)
        @klasa.user=current_user
        if @klasa.save
            redirect_to "/konto_klasas"
        else
            flash.now[:errors]=@klasa.errors.full_messages
            render :new
        end
    end
    def edit
        @klasa=Konto1Klasa.find_by(id:params[:id])
        if @klasa
            render :edit
        else
            redirect_to "/konto_klasas"
        end
    end
    def update
        @klasa=Konto1Klasa.find_by(id:params[:id])
        if @klasa.update(klasa_params)
            redirect_to "/konto_klasas"
        else
            flash.now[:errors]=@klasa.errors.full_messages
        end
    end
    def destroy
        @klasa=Konto1Klasa.find_by(id:params[:id])
        @klasa.destroy if @klasa
        redirect_to "/konto_klasas"
    end
    private
    def klasa_params
        params[:klasa].permit(:naziv,:klasa,:bilans,:aktivnost)
    end
end