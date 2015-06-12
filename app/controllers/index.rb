get '/' do
  @current_user = User.all.first.quaps.first.picture.picture_url
  # Answer = @current_user.quaps
  erb :index
end
