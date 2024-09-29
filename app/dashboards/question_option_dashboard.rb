require "administrate/base_dashboard"

class QuestionOptionDashboard < Administrate::BaseDashboard
  ATTRIBUTE_TYPES = {
    question: Field::BelongsTo,
    id: Field::Number,
    score: Field::Number,
    display_order: Field::Number,
    content: Field::RichText,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  FORM_ATTRIBUTES = %i[
    content
    score
    display_order
  ].freeze

  SHOW_PAGE_ATTRIBUTES = %i[
    question 
    id 
    content 
    score
    display_order
    created_at 
    updated_at
  ].freeze

  COLLECTION_ATTRIBUTES = %i[
    id
    score
    display_order
  ].freeze
end

