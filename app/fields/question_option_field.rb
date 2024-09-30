require "administrate/field/base"

class QuestionOptionField < Administrate::Field::Base
  def to_partial_path
    "/fields/question_option_field/#{page}"
  end
end
