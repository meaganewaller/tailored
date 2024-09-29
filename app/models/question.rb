class Question < ApplicationRecord
  broadcasts_refreshes

  belongs_to :creator, class_name: "Account"
  has_many :question_options, dependent: :destroy

  validates :name, presence: true

  accepts_nested_attributes_for :question_options, allow_destroy: true
end
