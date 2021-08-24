class TransakcijesController < ApplicationController
    before_action :redirect_not_logged_user
    def index
        @transakcije=Transakcije.where(user_id:[nil,current_user.id])
        @nazivi_kolona=Transakcije::NAZIVI_KOLONA
        render :index
    end
    def new
        render :new
    end
    def create
        @transakcije=Transakcije.new(transakcije_params)
        @transakcije.oporezivo=params[:transakcije][:oporezivo].nil? ? false : true
        @transakcije.user=current_user
        if @transakcije.save
            redirect_to "/transakcijes"
        else
            flash.now[:errors]=@transakcije.errors.full_messages
            render :new
        end
    end
    def edit
        @transakcije=Transakcije.find_by(id:params[:id])
        if @transakcije
            render :edit
        else
            redirect_to "/transakcijes"
        end
    end
    def update
        @transakcije=Transakcije.find_by(id:params[:id])
        @transakcije.oporezivo=params[:transakcije][:oporezivo].nil? ? false : true
        if @transakcije.update(transakcije_params)
            redirect_to "/transakcijes"
        else
            flash.now[:errors]=@transakcije.errors.full_messages
        end
    end
    def destroy
        @transakcije=Transakcije.find_by(id:params[:id])
        @transakcije.destroy if @transakcije
        redirect_to "/transakcijes"
    end
    private
    def transakcije_params
        params[:transakcije].permit(:naziv,:r_br,:grupa)
    end 
end