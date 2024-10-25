import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="accordion"
export default class extends Controller {
  static targets = ["content", "icon"]

  toggle() {
    this.contentTarget.classList.toggle("collapsed")

    if (this.contentTarget.classList.contains("collapsed")) {
      this.iconTarget.innerHTML = this.downArrowIcon()
    } else {
      this.iconTarget.innerHTML = this.upArrowIcon()
    }
  }

  get upArrowIcon() {
    return '<svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="size-6"><path stroke-linecap="round" stroke-linejoin="round" d="M4.5 10.5 12 3m0 0 7.5 7.5M12 3v18" /></svg>'
  }

  get downArrowIcon() {
    return '<svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="size-6"><path stroke-linecap="round" stroke-linejoin="round" d="M19.5 13.5 12 21m0 0-7.5-7.5M12 21V3" /></svg>'
  }
}
