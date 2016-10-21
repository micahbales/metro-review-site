class ReviewsController < ApplicationController
  def create
    @station = Station.find(params[:station_id])
    @review = Review.new(review_params)
    @review.station = @station

    if @review.save
      flash[:alert] = "Your comment has been successfully created!"
      redirect_to @station
    else
      flash[:error] = "Please provide both a title and a review"
      @reviews = @station.reviews
      render 'stations/show'
    end
  end

  private
  def review_params
    params.require(:review).permit(:title, :content, :station_id)
  end
end
