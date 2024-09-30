class Answer < ApplicationRecord
  belongs_to :quiz_attempt
  belongs_to :quiz_question
  belongs_to :question_option
end
