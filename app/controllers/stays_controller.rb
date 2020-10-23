class StaysController < ApplicationController

    before_action :find_stay, only: [:show, :edit, :update, :destroy]

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


    def create
      @stay = Stay.new(stay_params)
     @country = @stay.property.city.country
      if @stay.save
        redirect_to  user_session_path
      else
        flash[:errors] = @stay.errors.full_messages
        redirect_to new_stay_path
      end
    end

    def edit
    end

    def update
      if @stay.update(stay_params)
        redirect_to root_path
      else
        flash[:errors] = @stay.errors.full_messages
        redirect_to edit_stay_path
      end
    end

    def destroy
      @stay.delete
      redirect_to root_path
    end

    private

    def find_stay
      @stay = Stay.find(params[:id])
    end

    def stay_params
      params.require(:stay).permit(:property_id, :nomad_id, :checkin, :checkout)
    end

end