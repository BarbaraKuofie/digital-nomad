class StaysController < ApplicationController

    before_action :find_stay, only: [:show, :edit, :update]

    def index
      @stays = Stay.all
    end

    def show
    end

    def new
    end

    def edit
    end

    def create
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