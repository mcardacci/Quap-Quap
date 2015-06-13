get "/user/:id" do
  current_user = User.find_by(id: session[:user_id])
  reject_hacker
  erb :'user/user_profile', locals:{user: current_user}
end
