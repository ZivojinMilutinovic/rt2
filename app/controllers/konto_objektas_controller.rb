class KontoObjektasController < ApplicationController
    before_action :redirect_not_logged_user
    def index
        @konto_objekta=Konto4ObjektiPrometas.where(user_id:[nil,current_user.id])
        @nazivi_kolona=Konto4ObjektiPrometas::NAZIVI_KOLONA
        render :index
    end
    def new
        render :new
    end
    def create
        @obj=Konto4ObjektiPrometas.new(obj_params)
        @obj.ispravka=params[:obj][:ispravka].nil? ? false : true
        @obj.user=current_user
        if @obj.save
            redirect_to "/konto_objektas"
        else
            flash.now[:errors]=@obj.errors.full_messages
            render :new
        end
    end
    def edit
        @obj=Konto4ObjektiPrometas.find_by(id:params[:id])
        if @obj
            render :edit
        else
            redirect_to "/konto_objektas"
        end
    end
    def update
        @obj=Konto4ObjektiPrometas.find_by(id:params[:id])
        @obj.ispravka=params[:obj][:ispravka].nil? ? false : true
        if @obj.update(obj_params)
            redirect_to "/konto_objektas"
        else
            flash.now[:errors]=@obj.errors.full_messages
        end
    end
    def destroy
        @obj=Konto4ObjektiPrometas.find_by(id:params[:id])
        @obj.destroy if @obj
        redirect_to "/konto_objektas"
    end
    private
    def obj_params
        params[:obj].permit(:naziv,:konto3_sintetika_id,:sifra_cetvrti_broj,:objekat,:tip)
    end 
end