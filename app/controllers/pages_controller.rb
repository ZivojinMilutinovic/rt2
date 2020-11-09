class PagesController < ApplicationController
    def index
    end
    def kontrolni_broj
        broj=params["broj"]
        if !broj.nil?
            if !helpers.valid_control_number(broj)
                flash.now[:errors]="Niste uneli broj u ispravnom formatu"
            else
                @kontrolni_broj=helpers.izracunaj_sumu(broj)
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
        @devize=Deviza.all
        @nazivi_kolona=Deviza::NAZIVI_KOLONA
        response=Faraday.get path
        @data=JSON.parse(response.body)["result"]
        render :kursna_lista
    end
end