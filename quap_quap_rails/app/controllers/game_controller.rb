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
end