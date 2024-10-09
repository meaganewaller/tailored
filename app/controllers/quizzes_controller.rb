class QuizzesController < ApplicationController
  before_action :set_quiz, only: [:show]
  before_action :set_quiz_attempt, only: [:show]
  layout 'dashboard'

  def index
    @pagy, @quizzes = pagy(Quiz.sort_by_params(params[:sort], sort_direction))
  end

  def show
    @quiz_questions = @quiz.quiz_questions.includes(question: :question_options)
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_quiz
    @quiz = Quiz.find(params[:id])

    # Uncomment to authorize with Pundit
    # authorize @quiz
  rescue ActiveRecord::RecordNotFound
    redirect_to quizzes_path
  end

  def set_quiz_attempt
    @quiz_attempt = QuizAttempt.find_or_create_by(
      account: current_account,
      quiz: @quiz,
      status: QuizAttempt.statuses[:in_progress]
    ) do |attempt|
      attempt.started_at = Time.now
    end
  end
end
