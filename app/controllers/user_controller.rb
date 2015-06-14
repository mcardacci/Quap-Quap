get '/user/new' do
  erb :'user/new_user'
end

get "/user/:id" do
  current_user = User.find_by(id: session[:user_id])
  reject_hacker
  erb :'user/user_profile', locals:{user: current_user}
end

get "/user/:id/delete" do
  current_user = User.find_by(id: session[:user_id])
  reject_hacker
  erb :'user/delete_user', locals:{user: current_user}
end


get "/user/:id/edit" do
  current_user = User.find_by(id: session[:user_id])
  erb :'user/edit_user', locals:{user: current_user}
end

delete "/user/:id" do
  current_user = User.find_by(id: session[:user_id])
  reject_hacker
  current_user.destroy
  redirect "/"
end

put "/user/:id" do
  current_user = User.find_by(id: session[:user_id])
  reject_hacker
  current_user.update(params[:user])
  redirect "/user/#{current_user.id}"
end

post "/user/new" do
  new_user = User.create(params[:user])
  if new_user.save
    session[:user_id] = new_user.id
    redirect "/user/#{new_user.id}"
  else
    return [500, "Something went wrong"]
  end
end
