class Api::V1::VotesController < ApplicationController
  protect_from_forgery with: :null_session

  def create
    @review = Review.find(vote_params[:review_id])
    @station = @review.station
    @vote = Vote.find_by(user_id: current_user.id, review_id: @review.id)
    user_input = vote_params[:value].to_i

    if @vote
      if @vote.value == 0

        @vote.value = user_input
        @vote.save
        # "Your vote has been updated!"
      else
        if @vote.value == user_input
          # "You can only vote once!"
        else
          @vote.value = 0
          @vote.save
          # "Your vote has been updated!"
        end
      end
    else
      # add new vote
      @vote = Vote.create(vote_params)
      # "Thanks for your vote!"
    end
  end

  private

  def vote_params
    params.require(:vote).permit(:user_id, :review_id, :value)
  end
end
