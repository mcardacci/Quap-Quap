class GameController < ApplicationController
  def game_run
    
    #this redirect below needs a route

    redirect '/game_over' unless Quap.choices
    @metrics = Quap.metrics
    @current_user = User.find_by(id: session[:user_id])
    @answer_options = Quap.choices
    @correct_answer = @answer_options[0]
    @answer_options.shuffle!
  end

  def decide
    user_input = params[:answer][:user_choice]
    audio_file = Quap.find_by(question_id: user_input).question.body.split(" ").last.sub!(/[?]?$/, '')
    asset_path = ActionController::Base.helpers.asset_path("audio/#{audio_file}.mp3")
    if user_input == params[:id]
      Quap.correct(user_input)
      puts `mpg123 #{asset_path}`
      redirect '/game?status=correct'
    elsif user_input != params[:id]
      Quap.incorrect(params[:id])
      redirect '/game?status=incorrect'
    end
  end
end