import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="question-options"
export default class extends Controller {
  static targets = ["template", "container"]

  addOption(event) {
    event.preventDefault();
    const content = this.templateTarget.innerHTML.replace(/NEW_RECORD/g, new Date().getTime());
    this.containerTarget.insertAdjacentHTML("beforeend", content);
  }

  removeOption(event) {
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
