class ReviewsController < ApplicationController
    before_action :find_review, only: [:show, :edit, :update]

    def index
      @reviews = Review.all
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

    def find_review
      @review = Review.find(params[:id])
    end

    def review_params
      params.require(:review).permit(:property_id, :nomad_id, :description, :rating)
    end

end