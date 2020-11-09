class KontoSintetikasController < ApplicationController
    def index
        @konto_sintetika=Konto3Sintetika.where(user_id:[nil,current_user.id])
        @nazivi_kolona=Konto3Sintetika::NAZIVI_KOLONA
        render :index
    end
    def new
        render :new
    end
    def create
        @sintetika=Konto3Sintetika.new(sintetika_params)
        @sintetika.user=current_user
        if @sintetika.save
            redirect_to "/konto_sintetikas"
        else
            flash.now[:errors]=@sintetika.errors.full_messages
            render :new
        end
    end
    def edit
        @sintetika=Konto3Sintetika.find_by(id:params[:id])
        if @sintetika
            render :edit
        else
            redirect_to "/konto_sintetikas"
        end
    end
    def update
        @sintetika=Konto3Sintetika.find_by(id:params[:id])
        if @sintetika.update(sintetika_params)
            redirect_to "/konto_sintetikas"
        else
            flash.now[:errors]=@sintetika.errors.full_messages
        end
    end
    def destroy
        @sintetika=Konto3Sintetika.find_by(id:params[:id])
        @sintetika.destroy if @sintetika
        redirect_to "/konto_sintetikas"
    end
    private
    def sintetika_params
        params[:sintetika].permit(:naziv,:konto2_grupa_id,:konto)
    end
end