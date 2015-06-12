require 'pry'
get '/game' do
  @current_user = User.find_by(id: session[:user_id])
  @answer_options = Quap.questions
  @correct_answer = @answer_options[0]
  @answer_options.shuffle!
  erb :'/game/show'
end

post '/game/:correct_answer' do
  binding.pry
end
