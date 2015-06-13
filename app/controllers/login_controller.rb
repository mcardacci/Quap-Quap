get "/login" do
  erb :login
end

post "/login" do
  @user = User.find_by(name: params[:user][:name])
  return [500, "Invalid User"] unless @user
    if @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect "/user/#{@user.id}"
    else
     erb :login
    end
end


get "/logout" do
  session[:user_id] = nil
  redirect "/"
end

