`brew install mpg123`
names = %w(marco denny mike ben)

4.times do |i|
  User.create(name: names[i], password: "123")
end

File.open("db/chinese.rb", "r") do |f|
  f.each_line do |line|
    path = line.split[1].to_s
    answer = line.split.first.to_s
    Picture.create(path: 'pictures/' + path + '.png')
    Answer.create(body: answer)
    Question.create(body: "Which one means " + path + "?")
  end
end
27.times do |i|
  Quap.create(question_id: i+1, answer_id: i+1, picture_id: i+1, user_id: i+1)
end
