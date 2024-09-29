import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["question", "submit"]

  connect() {
    this.currentIndex = 0; // Keep track of the currently visible question
  }

  // This handles when the user clicks anywhere on a question
  clickQuestion(event) {
    const question = event.currentTarget;

    // Remove the 'answered' class when the question is clicked
    if (question.classList.contains("answered")) {
      question.classList.remove("answered");
      question.classList.add("revisited");
    }
  }

  selectOption(event) {
    const question = event.target.closest("[data-question-id]");

    // Mark the question as answered after selecting an option
    question.classList.add("answered");
    question.classList.remove("revisited");

    // Show the next question
    this.showNextQuestion();
    this.checkCompletion();
  }

  showNextQuestion() {
    this.currentIndex++;
    if (this.currentIndex < this.questionTargets.length) {
      this.questionTargets[this.currentIndex].classList.remove("hidden");
    } else {
      this.submitTarget.classList.remove("hidden");
    }
  }

  checkCompletion() {
    let allAnswered = true;
    this.questionTargets.forEach((question) => {
      if (!question.classList.contains("answered")) {
        allAnswered = false;
      }
    });

    if (allAnswered) {
      this.submitTarget.disabled = false;
    } else {
      this.submitTarget.disabled = true;
    }
  }
}

