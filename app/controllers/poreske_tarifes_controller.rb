class PoreskeTarifesController < ApplicationController
    before_action :redirect_not_logged_user
    def index
        @tarife=PoreskeTarife.where(user_id:[nil,current_user.id])
        @nazivi_kolona=PoreskeTarife::NAZIVI_KOLONA
        render :index
    end
    def new
        render :new
    end
    def create
        @tarife=PoreskeTarife.new(tarife_params)
        @tarife.user=current_user
        if @tarife.save
            redirect_to "/poreske_tarifes"
        else
            flash.now[:errors]=@tarife.errors.full_messages
            render :new
        end
    end
    def edit
        @tarife=PoreskeTarife.find_by(id:params[:id])
        if @tarife
            render :edit
        else
            redirect_to "/poreske_tarifes"
        end
    end
    def update
        @tarife=PoreskeTarife.find_by(id:params[:id])
        if @tarife.update(tarife_params)
            redirect_to "/poreske_tarifes"
        else
            flash.now[:errors]=@tarife.errors.full_messages
        end
    end
    def destroy
        @tarife=PoreskeTarife.find_by(id:params[:id])
        @tarife.destroy if @tarife
        redirect_to "/poreske_tarifes"
    end
    private
    def tarife_params
        params[:tarifa].permit(:naziv,:tarifa,:stopa,:poc_dat,:zav_dat)
    end
end