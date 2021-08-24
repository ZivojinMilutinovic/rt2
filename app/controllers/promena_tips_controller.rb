class PromenaTipsController < ApplicationController
    before_action :redirect_not_logged_user
    def index
        @promena_tips=PromenaTip.where(user_id:[nil,current_user.id])
        @nazivi_kolona=PromenaTip::NAZIVI_KOLONA
        render :index
    end
    def new
        render :new
    end
    def create
        @promena_tips=PromenaTip.new(promena_tips_params)
        @promena_tips.user=current_user
        dodeli_boolean_vrednosti(@promena_tips)
        if @promena_tips.save
            redirect_to "/promena_tips"
        else
            flash.now[:errors]=@promena_tips.errors.full_messages
            render :new
        end
    end
    def edit
        @promena_tip=PromenaTip.find_by(id:params[:id])
        if @promena_tip
            render :edit
        else
            redirect_to "/promena_tips"
        end
    end
    def update
        @promena_tip=PromenaTip.find_by(id:params[:id])
        dodeli_boolean_vrednosti(@promena_tip)
        if @promena_tip.update(promena_tips_params)
            redirect_to "/promena_tips"
        else
            flash.now[:errors]=@promena_tip.errors.full_messages
        end
    end
    def destroy
        @promena_tips=PromenaTip.find_by(id:params[:id])
        @promena_tips.destroy if @promena_tips
        redirect_to "/promena_tips"
    end
    private
    def promena_tips_params
        params[:promena_tip].permit(:transakcija,:naziv_promene_tip,:odobrenje_labela,:zaduzenje_labela,:analitika_vise_objekta)
    end
    def dodeli_boolean_vrednosti(promena_tips)
        promena_tips.dupli_stav=params[:promena_tip][:dupli_stav].nil? ? false : true
        promena_tips.pdv_odbitak=params[:promena_tip][:pdv_odbitak].nil? ? false : true
        promena_tips.oporezivo_pdv=params[:promena_tip][:oporezivo_pdv].nil? ? false : true
        promena_tips.set_transakcija=params[:promena_tip][:set_transakcija].nil? ? false : true
    end

end