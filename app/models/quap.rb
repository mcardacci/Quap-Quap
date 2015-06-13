class Quap < ActiveRecord::Base

  belongs_to :question
  belongs_to :answer
  belongs_to :picture
  belongs_to :user

  def self.choices
    correct_answer = self.where(status: nil).sample
    if correct_answer == nil
      return nil
    else
      incorrect_answers = self.where.not(id: correct_answer.id).sample(3)
      questions = []
      questions << correct_answer
      questions << incorrect_answers
      questions.flatten
    end
  end

  def self.correct(input)
    answer = self.find_by(answer_id: input)
    answer.update(status: "correct")
  end

  def self.incorrect(input)
    # binding.pry
    answer = self.find_by(answer_id: input)
    answer.update(status: "incorrect")
  end

  def self.metrics
    metrics = {}
    metrics[:total] = self.all.count
    metrics[:current] = self.all.count - self.where(status: nil).count + 1
    return metrics
  end
end
