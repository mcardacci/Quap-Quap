class Quap < ActiveRecord::Base
  belongs_to :question
  belongs_to :answer
  belongs_to :picture
  belongs_to :user
end