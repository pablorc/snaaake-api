class ScoresController < ApplicationController
  skip_before_action :verify_authenticity_token

  NUMBER_OF_RESULTS = 10

  def index
    @scores = highscores
  end

  def create
    @score = Score.new(score_params)

    if @score.save
      render json: {
        result: 'OK',
        highscores: highscores.map { |score| [score.author, score.value] }
      }.to_json
    else
      render json: 'KO'.to_json
    end
  end

  private

  def highscores
    Score.limit(NUMBER_OF_RESULTS)
  end


  def score_params
    params.require(:score).permit(:author, :value)
  end
end
