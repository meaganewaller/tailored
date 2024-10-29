import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="sidebar"
export default class extends Controller {
  static targets = [
    "backdrop",
    "offCanvasMenu",
    "offCanvasMenuWrapper",
    "offCanvasMenuCloseButton",
  ]

  toggleOffCanvasMenu() {
    if (this.offCanvasMenuWrapperTarget.classList.contains("hidden")) {
      this.offCanvasMenuTarget.setAttribute("aria-hidden", false)
      this.offCanvasMenuWrapperTarget.classList.remove("hidden")
      this.backdropTarget.setAttribute("aria-hidden", false)
      this.offCanvasMenuCloseButtonTarget.classList.add("hidden")
    } else {
      this.backdropTarget.setAttribute("aria-hidden", true)
      this.offCanvasMenuTarget.classList.add("hidden")
      this.offCanvasMenuCloseButtonTarget.classList.remove("hidden")
      this.offCanvasMenuWrapperTarget.classList.add("hidden")
    }
  }
}
