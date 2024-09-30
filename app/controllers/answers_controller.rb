class AnswersController < ApplicationController
  before_action :set_quiz_attempt

  def create
    @answer = @quiz_attempt.answers.new(answer_params)

    if @answer.save
      # Handle successful answer saving (e.g., show the next question or a success message)
      redirect_to @quiz_attempt, notice: "Answer submitted successfully!"
    else
      # Handle errors
      redirect_to @quiz_attempt, alert: "There was a problem submitting your answer."
    end
  end

  private

  def set_quiz_attempt
    @quiz_attempt = QuizAttempt.find(params[:quiz_attempt_id])
  end

  def answer_params
    params.require(:answer).permit(:question_option_id, :quiz_question_id)
  end
end
