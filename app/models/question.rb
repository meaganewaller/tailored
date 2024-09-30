class Question < ApplicationRecord
  broadcasts_refreshes

  belongs_to :creator, class_name: "Account"
  has_many :question_options, dependent: :destroy
  has_many :quiz_questions, dependent: :destroy
  has_many :quizzes, through: :quiz_questions

  validates :name, presence: true

  accepts_nested_attributes_for :question_options, allow_destroy: true
end
