import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="sidebar"
export default class extends Controller {
  static targets = ["menu", "backdrop"]

  toggleMenu(event) {
    event.preventDefault()

    if (this.menuTarget.classList.contains("hidden")) {
      this.backdropTarget.classList.remove("hidden")
      this.menuTarget.classList.remove("hidden")
    } else {
      this.backdropTarget.classList.add("hidden")
      this.menuTarget.classList.add("hidden")
    }
  }
}
