class ReviewsController < ApplicationController

  before_action :redirect_if_not_logged_in 

def new
    if @coffee = Coffee.find_by_id(params[:coffee_id])
      @review = @coffee.reviews.build
    else
      @review = Review.new
    end
  end

  def create
    @review = current_user.reviews.build(review_params)
    if @review.save
      redirect_to review_path(@review)
    else
      render :new
    end
  end

  def show
    @review = Review.find_by_id(params[:id])
  end

  def index
    if @coffee = Coffee.find_by_id(params[:coffee_id])
      #nested
      @reviews = @coffee.reviews
    else
      #it's not nested
      @reviews = Review.all
    end
  end

  private

  def review_params
      params.require(:review).permit(:coffee_id, :content, :stars, :title)
  end

end
