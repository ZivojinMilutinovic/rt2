class OznakaObjektaPrometasController < ApplicationController
    before_action :redirect_not_logged_user
    def index
        @oznake_prometa=OznakaObjektaPrometas.where(user_id:[nil,current_user.id])
        @nazivi_kolona=OznakaObjektaPrometas::NAZIVI_KOLONA
        render :index
    end
    def new
        render :new
    end
    def create
        @oznake_prometa=OznakaObjektaPrometas.new(oznake_prometa_params)
        @oznake_prometa.user=current_user
        if @oznake_prometa.save
            redirect_to "/oznaka_objekta_prometas"
        else
            flash.now[:errors]=@oznake_prometa.errors.full_messages
            render :new
        end
    end
    def edit
        @oznaka=OznakaObjektaPrometas.find_by(id:params[:id])
        if @oznaka
            render :edit
        else
            redirect_to "/oznaka_objekta_prometas"
        end
    end
    def update
        @oznaka=OznakaObjektaPrometas.find_by(id:params[:id])
        if @oznaka.update(oznake_prometa_params)
            redirect_to "/oznaka_objekta_prometas"
        else
            flash.now[:errors]=@oznaka.errors.full_messages
        end
    end
    def destroy
        @oznake_prometa=OznakaObjektaPrometas.find_by(id:params[:id])
        @oznake_prometa.destroy if @oznake_prometa
        redirect_to "/oznaka_objekta_prometas"
    end
    private
    def oznake_prometa_params
        params[:oznaka].permit(:naziv_oznake,:oznaka)
    end

end