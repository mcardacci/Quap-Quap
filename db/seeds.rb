require 'faker'

User.create(name: "denny", password: "cat")
Question.create(question: "What is muh name?")
Answer.create(answer: "tek 9")
Picture.create(picture_url: 'pictures/Cat.jpg')
Quap.create(question_id: 1, answer_id: 1, picture_id: 1, user_id: 1)

20.times do |num|
  Quap.create(question: Question.create(question: Faker::Company.bs),
   answer: Answer.create(answer: Faker::Company.catch_phrase),
   picture: Picture.create(picture_url: Faker::Company.logo),
   user: User.create(name: Faker::Name.name, password: "123"))
end
