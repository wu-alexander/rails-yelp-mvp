class ReviewsController < ApplicationController
  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new
  end

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new(review_params)
    @review.restaurant = @restaurant

    if @review.save
      redirect_to @restaurant
    else
      render :new
    end
  end

  # def create
  #   @restaurant = Restaurant.new(restaurant_params)

  #   if @restaurant.save!
  #     redirect_to @restaurant
  #     # redirect_to restaurant_path(@restaurant)
  #     # redirect_to restaurant_path(@restaurant.id)
  #     # redirect_to "restaurants/#{@restaurant.id}"
  #   end
  # end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
