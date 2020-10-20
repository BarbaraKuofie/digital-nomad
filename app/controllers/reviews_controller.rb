class ReviewsController < ApplicationController
    before_action :find_review, only: [:show, :edit, :update]

    def index
      @reviews = Review.all
    end

    def show
    end

    def new
      @review = Review.new
    end

    def edit
    end

    def create
      @review = Review.new(params(review_params))
      if @review.save 
        redirect_to property_path(@property)
      else 
        render :new 
      end
    end

    def update
    end

    def delete 
      @property = @review.property
      @review.destroy 
      redirect_to property_path(@property)
    end 

    private

    def find_review
      @review = Review.find(params[:id])
    end

    def review_params
      params.require(:review).permit(:property_id, :nomad_id, :description, :rating)
    end

end