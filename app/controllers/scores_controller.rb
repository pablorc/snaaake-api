class ScoresController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    @score = Score.new(score_params)

    if @score.save
      render json: 'OK'.to_json
    else
      render json: 'KO'.to_json
    end
  end

  private


  def score_params
    params.require(:score).permit(:author, :value)
  end
end
