# == Schema Information
#
# Table name: quiz_questions
#
#  id            :bigint           not null, primary key
#  display_order :integer          default(0)
#  required      :boolean          default(TRUE)
#  shuffleable   :boolean          default(FALSE)
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  question_id   :bigint           not null
#  quiz_id       :bigint           not null
#
# Indexes
#
#  index_quiz_questions_on_question_id  (question_id)
#  index_quiz_questions_on_quiz_id      (quiz_id)
#
# Foreign Keys
#
#  fk_rails_...  (question_id => questions.id)
#  fk_rails_...  (quiz_id => quizzes.id)
#
require "test_helper"

class QuizQuestionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
