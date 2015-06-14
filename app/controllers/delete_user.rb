get "/user/:id/delete" do
  current_user = User.find_by(id: session[:user_id])
  reject_hacker
  current_user.destroy
  redirect "/"
end
