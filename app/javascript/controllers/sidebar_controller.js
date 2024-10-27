import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="sidebar"
export default class extends Controller {
  static targets = ["offcanvasNav", "backdrop", "closeMenuButton", "openMenuButton"]

  toggle() {
    if (this.offcanvasNavTarget.classList.contains("hidden")) {
      this.backdropTarget.classList.remove("hidden")
      this.offcanvasNavTarget.classList.remove("hidden")
      this.openMenuButtonTarget.classList.add("hidden")
      this.closeMenuButtonTarget.classList.remove("hidden")
    } else {
      this.backdropTarget.classList.add("hidden")
      this.offcanvasNavTarget.classList.add("hidden")
      this.openMenuButtonTarget.classList.remove("hidden")
      this.closeMenuButtonTarget.classList.add("hidden")
    }
  }
}
