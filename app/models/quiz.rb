class Quiz < ApplicationRecord
  broadcasts_refreshes

  belongs_to :creator, class_name: "Account"
  has_many :quiz_questions, dependent: :destroy
  has_many :questions, through: :quiz_questions

  validates :title, presence: true

  accepts_nested_attributes_for :quiz_questions, allow_destroy: true
end
