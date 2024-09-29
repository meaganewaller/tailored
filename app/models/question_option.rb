class QuestionOption < ApplicationRecord
  belongs_to :optionable, polymorphic: true, optional: true
  belongs_to :question

  has_rich_text :content

  attribute :score, :integer, default: 0
  attribute :order, :integer, default: 0
end
