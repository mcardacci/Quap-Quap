get "/login" do
  erb :login
end

post "/login" do
  @user = User.find_by(name: params[:user][:name])
    if @user.password == params[:password]
      session[:user_id] = @user.id
      "denny wins"
      # binding.pry
      redirect to "/user/#{@user.id}"
    else

      "denny loses"
    #   @errors = ["Wrong username/password"]
     # erb :login
    end
end

