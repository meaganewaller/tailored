class QuizQuestion < ApplicationRecord
  belongs_to :quiz
  belongs_to :question

  validates :display_order, numericality: { only_integer: true }
  validates :shuffleable, :required, inclusion: { in: [true, false] }
end
