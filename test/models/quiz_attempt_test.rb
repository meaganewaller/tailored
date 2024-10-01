# == Schema Information
#
# Table name: quiz_attempts
#
#  id           :bigint           not null, primary key
#  completed_at :datetime
#  score        :integer          default(0), not null
#  started_at   :datetime
#  status       :integer          default("in_progress"), not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  account_id   :bigint           not null
#  quiz_id      :bigint           not null
#
# Indexes
#
#  index_quiz_attempts_on_account_id  (account_id)
#  index_quiz_attempts_on_quiz_id     (quiz_id)
#
# Foreign Keys
#
#  fk_rails_...  (account_id => accounts.id)
#  fk_rails_...  (quiz_id => quizzes.id)
#
require "test_helper"

class QuizAttemptTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
