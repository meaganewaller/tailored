# == Schema Information
#
# Table name: quizzes
#
#  id          :bigint           not null, primary key
#  description :text
#  title       :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  creator_id  :bigint           not null
#
# Indexes
#
#  index_quizzes_on_creator_id  (creator_id)
#
# Foreign Keys
#
#  fk_rails_...  (creator_id => accounts.id)
#
require "test_helper"

class QuizTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
