
# User.create(name: "denny", password: "cat")
# Question.create(body: "What is muh name?")
# Answer.create(body: "tek 9")
# Picture.create(path: 'pictures/Cat.jpg')
# Quap.create(question_id: 1, answer_id: 1, picture_id: 1, user_id: 1)

# User.create(name: "marco", password: "123")
# Question.create(body: "Color?")
# Answer.create(body: "blue")
# Picture.create(path: 'pictures/Cat.jpg')
# Quap.create(question_id: 2, answer_id: 2, picture_id: 1, user_id: 2)

# User.create(name: "mike", password: "123")
# Question.create(body: "Structure?")
# Answer.create(body: "Pillar")
# Picture.create(path: 'pictures/Cat.jpg')
# Quap.create(question_id: 3, answer_id: 3, picture_id: 1, user_id: 3)

# User.create(name: "ben", password: "123")
# Question.create(body: "Book?")
# Answer.create(body: "neuromancer")
# Picture.create(path: 'pictures/Cat.jpg')
# Quap.create(question_id: 4, answer_id: 4, picture_id: 1, user_id: 4)

File.open("db/chinese.rb", "r") do |f|
  f.each_line do |line|
    path = line.split[1].to_s
    answer = line.split.first.to_s
    Picture.create(path: 'pictures/' + path + '.png')
    Answer.create(body: answer)
    Question.create(body: "Which one means " + answer + "?")
  end
end
27.times do |i|
  Quap.create(question_id: i+1, answer_id: i+1, picture_id: i+1, user_id: i+1)
end
