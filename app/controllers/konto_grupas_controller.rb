class KontoGrupasController < ApplicationController
    def index
        @konto_grupa=Konto2Grupa.where(user_id:[nil,current_user.id])
        @nazivi_kolona=Konto2Grupa::NAZIVI_KOLONA
        render :index
    end
    def new
        render :new
    end
    def create
        @grupa=Konto2Grupa.new(grupa_params)
        @grupa.user=current_user
        if @grupa.save
            redirect_to "/konto_grupas"
        else
            flash.now[:errors]=@grupa.errors.full_messages
            render :new
        end
    end
    def edit
        @grupa=Konto2Grupa.find_by(id:params[:id])
        if @grupa
            render :edit
        else
            redirect_to "/konto_grupas"
        end
    end
    def update
        @grupa=Konto2Grupa.find_by(id:params[:id])
        if @grupa.update(grupa_params)
            redirect_to "/konto_grupas"
        else
            flash.now[:errors]=@grupa.errors.full_messages
        end
    end
    def destroy
        @grupa=Konto2Grupa.find_by(id:params[:id])
        @grupa.destroy if @grupa
        redirect_to "/konto_grupas"
    end
    private
    def grupa_params
        params[:grupa].permit(:naziv,:konto1_klasa_id,:grupa)
    end 
end