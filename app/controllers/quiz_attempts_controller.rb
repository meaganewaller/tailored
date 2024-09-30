class QuizAttemptsController < ApplicationController
  before_action :set_quiz_attempt, only: [:complete]

  # Other actions for quiz_attempts (like show, create)...
  def complete
    # Mark the quiz attempt as completed
    if @quiz_attempt.update(status: :completed, completed_at: Time.now)
      redirect_to @quiz_attempt, notice: "Quiz completed successfully!"
    else
      redirect_to @quiz_attempt, alert: "There was a problem completing the quiz."
    end
  end

  private

  def set_quiz_attempt
    @quiz_attempt = QuizAttempt.find(params[:id])
  end
end
