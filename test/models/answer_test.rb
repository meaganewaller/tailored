# == Schema Information
#
# Table name: answers
#
#  id                 :bigint           not null, primary key
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  account_id         :bigint           not null
#  question_option_id :bigint           not null
#  quiz_attempt_id    :bigint           not null
#  quiz_question_id   :bigint           not null
#
# Indexes
#
#  index_answers_on_account_id          (account_id)
#  index_answers_on_question_option_id  (question_option_id)
#  index_answers_on_quiz_attempt_id     (quiz_attempt_id)
#  index_answers_on_quiz_question_id    (quiz_question_id)
#
# Foreign Keys
#
#  fk_rails_...  (account_id => accounts.id)
#  fk_rails_...  (question_option_id => question_options.id)
#  fk_rails_...  (quiz_attempt_id => quiz_attempts.id)
#  fk_rails_...  (quiz_question_id => quiz_questions.id)
#
require "test_helper"

class AnswerTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
