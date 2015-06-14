get "/login" do
  erb :'login_logout/login'
end

post "/login" do
  @user = User.find_by(name: params[:user][:name])
  redirect "/login?invalid=invalid_user_or_password" unless @user
    if @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect "/user/#{@user.id}"
    end
end

get "/logout" do
  session[:user_id] = nil
  redirect "/"
end

