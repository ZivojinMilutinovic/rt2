class PagesController < ApplicationController
    before_action :redirect_not_logged_user
    def index
    end
    def kontrolni_broj
        broj=params["broj"]
        if !broj.nil?
            if !helpers.valid_control_number(broj)
                flash.now[:errors]="Niste uneli broj u ispravnom formatu"
            else
                @kontrolni_broj=helpers.izracunaj_sumu(broj)
                @rezultat=broj+@kontrolni_broj.to_s
            end
        end
        
        render :kontrolni_broj
    end
    def kursna_lista 
        path="https://api.kursna-lista.info/#{ENV["KURSNA_LISTA_API_KEY"]}/kursna_lista"
        if params[:date] && params[:date]!=""
            date=Date.parse(params[:date])
             if date<Date.today
                path="https://api.kursna-lista.info/#{ENV["KURSNA_LISTA_API_KEY"]}/kl_na_dan/#{date.strftime("%d.%m.%Y")}"
             end
        end       
        @devize=Deviza.all.limit(5)
        @nazivi_kolona=Deviza::NAZIVI_KOLONA
        response=Faraday.get path
        @data=JSON.parse(response.body)["result"]
        render :kursna_lista
    end
    def jedinice_mere
        @nazivi_kolona=JedinicaMere::NAZIVI_KOLONA
        @jedinice_mere=JedinicaMere.all
        render :jedinice_mere
    end
    def profile_page
        render :profile_page
    end
end