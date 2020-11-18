class PartnerisController < ApplicationController
    before_action :redirect_not_logged_user
    def index
        @partneri=Partneri.where(user_id:[nil,current_user.id])
        @nazivi_kolona=Partneri::NAZIVI_KOLONA
        render :index
    end
    def new
        render :new
    end
    def create
        @partneri=Partneri.new(partneri_params)
        @partneri.user=current_user
        if @partneri.save
            redirect_to "/partneris"
        else
            flash.now[:errors]=@partneri.errors.full_messages
            render :new
        end
    end
    def edit
        @partneri=Partneri.find_by(id:params[:id])
        if @partneri
            render :edit
        else
            redirect_to "/partneris"
        end
    end
    def update
        @partneri=Partneri.find_by(id:params[:id])
        if @partneri.update(partneri_params)
            redirect_to "/partneris"
        else
            flash.now[:errors]=@partneri.errors.full_messages
        end
    end
    def destroy
        @partneri=Partneri.find_by(id:params[:id])
        @partneri.destroy if @partneri
        redirect_to "/partneris"
    end
    private
    def partneri_params
        params[:partneri].permit(:naziv,:opsti_podaci,:sifra,:tip,:sediste,:adresa,:kontakt,:status,:pib,:tekuci, :pdv)
    end

end