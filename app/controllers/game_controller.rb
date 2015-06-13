require 'pry'
get '/game' do
  redirect '/game_over' unless Quap.choices
  @metrics = Quap.metrics
  @current_user = User.find_by(id: session[:user_id])
  @answer_options = Quap.choices
  @correct_answer = @answer_options[0]
  @answer_options.shuffle!
  erb :'/game/show'
end

post '/game/:id' do
  user_input = params[:answer][:user_choice]
  if user_input == params[:id]
    Quap.correct(user_input)
    redirect '/game?status=correct'
  elsif user_input != params[:id]
    Quap.incorrect(params[:id])
    redirect '/game?status=incorrect'
  end
end
