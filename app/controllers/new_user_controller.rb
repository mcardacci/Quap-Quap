get '/user/new' do
  erb :new_user
end

get "/user/:id" do
  current_user = User.find_by(id: session[:user_id])
  erb :user_profile
end

post "/user/new" do
  new_user = User.create(params[:user])
  if new_user.save
    session[:user_id] = new_user.id
    redirect "/user/#{new_user.id}"
  else
    return [500, "Something went wrong"]
end


