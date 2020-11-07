class KontoGrupasController < ApplicationController
    def index
        @konto_grupa=Konto2Grupa.all
        @nazivi_kolona=Konto2Grupa::NAZIVI_KOLONA
        render :index
    end
    def new
    end
    def show
    end
    def edit
    end
    def update
    end
    def destroy
    end
    
end