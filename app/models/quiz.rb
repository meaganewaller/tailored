class Quiz < ApplicationRecord
  broadcasts_refreshes

  belongs_to :creator, class_name: "Account"

  validates :title, presence: true
end
