// app/javascript/controllers/quiz_questions_controller.js
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["template", "container"]

  addQuestion(event) {
    event.preventDefault();
    const content = this.templateTarget.innerHTML.replace(/NEW_RECORD/g, new Date().getTime());
    this.containerTarget.insertAdjacentHTML("beforeend", content);
  }

  removeQuestion(event) {
    event.preventDefault();
    let item = event.target.closest(".nested-field");
    if (item.dataset.newRecord === "true") {
      item.remove();
    } else {
      item.style.display = "none";
      item.querySelector("input[name*='_destroy']").value = "1";
    }
  }
}
