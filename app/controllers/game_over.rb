get "/game_over" do
  @correct = Quap.where(status: "correct").count
  @incorrect = Quap.where(status: "incorrect").count
  Quap.all.each {|quap| quap.update(status: nil)}
  erb :'game/game_over'
end
