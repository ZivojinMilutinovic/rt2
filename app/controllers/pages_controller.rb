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
end