get '/game' do
  @current_user = User.find_by(id: session[:user_id])
  @query = question_to_ask
  @answer_options =
  erb :'/game/show'
end
