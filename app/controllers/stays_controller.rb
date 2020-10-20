class StaysController < ApplicationController

    before_action :find_stay, only: [:show, :edit, :update]

    def index
      @stays = Stay.all
    end

    def show
    end

    def new
      if user_signed_in?   
        @stay = Stay.new 
      else
        redirect_to new_user_session_path
      end 
    end

    def edit
    end

    def create
      @stay = Stay.new(params(stay_params))
      if @stay.save 
        redirect_to user_path(current_user)
      else 
        flash[:errors] = @stay.errors.full_messages
        redirect_to new_stay_path
      end 
    end

    def update
    end

    private

    def find_stay
      @stay = Stay.find(params[:id])
    end

    def stay_params
      params.require(:stay).permit(:property_id, :nomad_id, :checkin, :checkout)
    end

end