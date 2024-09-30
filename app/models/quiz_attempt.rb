class QuizAttempt < ApplicationRecord
  belongs_to :account
  belongs_to :quiz

  has_many :answers, dependent: :destroy

  enum status: {in_progress: 0, completed: 1}
end
