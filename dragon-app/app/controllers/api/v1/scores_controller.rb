class Api::V1::ScoresController < ApplicationController

  def index
    @scores = Score.all
    render json: @scores
  end

  def update
    @score = Score.find(params[:id])

    @score.update(score_params)
    if @score.save
      render json: @score
    else
      render json: {errors: @score.errors.full_messages}, status: 422
    end
  end

  private
  def score_params
    params.permit(:value, :user)
  end


end
