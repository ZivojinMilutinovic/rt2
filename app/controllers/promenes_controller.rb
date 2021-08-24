class PromenesController < ApplicationController
    before_action :redirect_not_logged_user
    def index
        @promene=Promene.where(user_id:[nil,current_user.id])
        @nazivi_kolona=Promene::NAZIVI_KOLONA
        render :index
    end
    def new
        render :new
    end
    def create
        @promene=Promene.new(promene_params)
        @promene.user=current_user;
        dodeli_boolean_vrednosti(@promene)
        if @promene.save
            redirect_to "/promenes"
        else
            flash.now[:errors]=@promene.errors.full_messages
            render :new
        end
    end
    def edit
        @promena=Promene.find_by(id:params[:id])
        if @promena
            render :edit
        else
            redirect_to "/promenes"
        end
    end
    def update
        @promena=Promene.find_by(id:params[:id])
        dodeli_boolean_vrednosti(@promena)
        if @promena.update(promene_params)
            redirect_to "/promenes"
        else
            flash.now[:errors]=@promena.errors.full_messages
        end
    end
    def destroy
        @promene=Promene.find_by(id:params[:id])
        @promene.destroy if @promene
        redirect_to "/promenes"
    end
    private
    def promene_params
        params[:promene].permit(:promena_tip_naziv,:naziv)
    end
    def dodeli_boolean_vrednosti(promena)
        promena.pdv_odbitak=params[:promene][:pdv_odbitak].nil? ? false : true
        promena.ks=params[:promene][:ks].nil? ? false : true
    end
end