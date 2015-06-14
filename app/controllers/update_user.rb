get "/user/:id/edit" do
  current_user = User.find_by(id: session[:user_id])
  erb :'user/edit_user', locals:{user: current_user}
end

put "/user/:id" do
  current_user = User.find_by(id: session[:user_id])
  reject_hacker
  current_user.update(params[:user])
  redirect "/user/#{current_user.id}"
end
