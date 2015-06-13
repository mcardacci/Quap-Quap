get "/game_over" do
  @correct = Quap.where(status: "correct").count
  @incorrect = Quap.where(status: "incorrect").count
  erb :'game/game_over'
end
