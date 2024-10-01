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
class Quiz < ApplicationRecord
  broadcasts_refreshes

  belongs_to :creator, class_name: "Account"
  has_many :quiz_questions, dependent: :destroy
  has_many :questions, through: :quiz_questions
  has_many :quiz_attempts

  validates :title, presence: true

  accepts_nested_attributes_for :quiz_questions, allow_destroy: true
end
