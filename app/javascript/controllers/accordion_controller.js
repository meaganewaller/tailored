import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="accordion"
export default class extends Controller {
  static targets = ['content', 'icon']

  toggle(event) {
    console.log("Toggling*************************")
    console.log("Event", event)
  }
}
