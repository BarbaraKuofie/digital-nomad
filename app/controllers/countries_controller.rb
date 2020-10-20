class CountriesController < ApplicationController

    before_action :find_country, only: [:show, :edit, :update]

    def index
      @countries = Country.all
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

    def find_country
      @country = Country.find(params[:id])
    end

    def country_params
      params.require(:country).permit(:name)
    end
end