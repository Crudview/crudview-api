class ReviewsController < ApplicationController
  before_action :set_reviews, only[:show, :update, :destroy]

  def index
    @reviews = Review.all
    render json: @reviews
  end

  def show
    render json: @review
  end

  def create
    @review = Review.create(review_params)
  end

  def update
    @review = Review.update(review_params)
  end

  def destroy
    @review.destroy
  end

  private

  def set_reviews
    @review = Review.find(params[:id])
  end

  def review_params
    params.permit(:comment, :user_id, :restaurant_id)
  end
end
