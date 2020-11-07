class KontoKlasasController < ApplicationController
    def index
        @konto_klase=Konto1Klasa.all
        @nazivi_kolona=Konto1Klasa::NAZIVI_KOLONA;
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