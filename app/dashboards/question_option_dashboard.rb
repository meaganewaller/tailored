require "administrate/base_dashboard"

class QuestionOptionDashboard < Administrate::BaseDashboard
  ATTRIBUTE_TYPES = {
    id: Field::Number,
    question: 
  }

  FORM_ATTRIBUTES = %i[
    id
  ]
end

