class MagacinisController < ApplicationController
    before_action :redirect_not_logged_user
    def index
        
        @magacini=Magacini.where(user_id:[nil,current_user.id])
        @nazivi_kolona=Magacini::NAZIVI_KOLONA
        render :index
    end
    def new
        render :new
    end
    def create
        @magacini=Magacini.new(magacini_params)
        @magacini.user=current_user
        if @magacini.save
            redirect_to "/magacinis"
        else
            flash.now[:errors]=@magacini.errors.full_messages
            render :new
        end
    end
    def edit
        @magacini=Magacini.find_by(id:params[:id])
        if @magacini
            render :edit
        else
            redirect_to "/magacinis"
        end
    end
    def update
        @magacini=Magacini.find_by(id:params[:id])
        if @magacini.update(magacini_params)
            redirect_to "/magacinis"
        else
            flash.now[:errors]=@magacini.errors.full_messages
        end
    end
    def destroy
        @magacini=Magacini.find_by(id:params[:id])
        @magacini.destroy if @magacini
        redirect_to "/magacinis"
    end
    private
    def magacini_params
        params[:magacin].permit(:naziv,:objekti_id,:zalihe,:adresa,:lokacija,:sifra,:konto,:oznaka)
    end

end