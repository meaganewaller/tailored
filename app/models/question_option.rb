# == Schema Information
#
# Table name: question_options
#
#  id              :bigint           not null, primary key
#  display_order   :integer          default(0)
#  optionable_type :string
#  score           :integer          default(0)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  optionable_id   :integer
#  question_id     :bigint           not null
#
# Indexes
#
#  index_question_options_on_optionable_type_and_optionable_id  (optionable_type,optionable_id)
#  index_question_options_on_question_id                        (question_id)
#
# Foreign Keys
#
#  fk_rails_...  (question_id => questions.id)
#
class QuestionOption < ApplicationRecord
  belongs_to :optionable, polymorphic: true, optional: true
  belongs_to :question

  has_many :answers

  has_rich_text :content

  attribute :score, :integer, default: 0
  attribute :display_order, :integer, default: 0
end
