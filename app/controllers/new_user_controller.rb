get '/user/new' do
  erb :new_user
end

post "/user/new" do
  new_user = User.new(params[:user])
  if new_user.save
    session[:user_id] = new_user.id
    redirect "/user/#{new_user.id}"
  else
    return [500, "Something went wrong"]
  end
end


