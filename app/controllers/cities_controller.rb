class CitiesController < ApplicationController

    before_action :find_city, only: [:show, :edit, :update]

    def index
      @cities = City.all
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

    def find_city
      @city = City.find(params[:id])
    end

    def city_params
      params.require(:city).permit(:name, :country_id)
    end

end