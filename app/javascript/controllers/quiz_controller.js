import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["question", "submit"]

  connect() {
    this.currentIndex = 0;
    this.checkCompletion();
  }

  // This handles when the user clicks anywhere on a question
  clickQuestion(event) {
    const question = event.currentTarget;

    // Remove the 'answered' class when the question is clicked
    if (question.classList.contains("answered") && question.classList.contains("inactive")) {
      question.classList.remove("answered");
      question.classList.remove("inactive");
      question.classList.add("active")
    }
  }

  selectOption(event) {
    const question = event.target.closest("[data-question-id]");

    // Mark the question as answered after selecting an option
    question.classList.remove("active");
    question.classList.add("answered");
    question.classList.add("inactive");

    // Show the next question
    this.showNextQuestion();
    this.checkCompletion();
  }

  showNextQuestion() {
    this.currentIndex++;
    if (this.currentIndex < this.questionTargets.length) {
      const nextQuestion = this.questionTargets[this.currentIndex];
      nextQuestion.classList.remove("inactive");
      nextQuestion.classList.add("active")

      nextQuestion.scrollIntoView({ behavior: "smooth" });
    } else {
      this.checkCompletion();
      this.submitTarget.scrollIntoView({ behavior: "smooth" });
    }
  }

  checkCompletion() {
    let allRequiredAnswered = true;

    this.questionTargets.forEach((question) => {
      const isRequired = question.querySelector("[data-question-required='true']") !== null;
      const isAnswered = question.classList.contains("answered");

      if (isRequired && !isAnswered) {
        allRequiredAnswered = false;
      }
    });

    // Enable or disable the submit button based on whether all required questions are answered
    this.submitTarget.disabled = !allRequiredAnswered;
  }
}
