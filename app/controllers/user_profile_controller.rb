get "/user/:id" do
  current_user = User.find_by(id: session[:user_id])

  erb :'/user/user_profile', locals:{user: current_user}
end
