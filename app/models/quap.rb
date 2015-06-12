class Quap < ActiveRecord::Base

  belongs_to :question
  belongs_to :answer
  belongs_to :picture
  belongs_to :user

  def self.questions
    correct_answer = self.where(status: nil).sample
    incorrect_answers = self.where.not(id: correct_answer.id).sample(3)
    questions = []
    questions << correct_answer
    questions << incorrect_answers
    questions.flatten
  end
end
