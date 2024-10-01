# == Schema Information
#
# Table name: questions
#
#  id         :bigint           not null, primary key
#  content    :text
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  creator_id :bigint           not null
#
# Indexes
#
#  index_questions_on_creator_id  (creator_id)
#
# Foreign Keys
#
#  fk_rails_...  (creator_id => accounts.id)
#
class Question < ApplicationRecord
  broadcasts_refreshes

  belongs_to :creator, class_name: "Account"
  has_many :question_options, dependent: :destroy
  has_many :quiz_questions, dependent: :destroy
  has_many :quizzes, through: :quiz_questions

  validates :name, presence: true

  accepts_nested_attributes_for :question_options, allow_destroy: true
end
