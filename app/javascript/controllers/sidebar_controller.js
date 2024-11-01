import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="sidebar"
export default class extends Controller {
  static targets = [
    "sidebarContainer"
  ]

  toggle(e) {
    e.preventDefault();
    this.switchCurrentState();
  }

  switchCurrentState() {
    const expanded = this.element.dataset.expanded === "true" ? "false" : "true";
    this.element.dataset.expanded = expanded;
    document.cookie = `sidebar_expanded=${expanded}`;

    if (expanded) {
      this.sidebarContainerTarget.classNames.remove("hidden")
    } else {
      this.sidebarContainerTarget.classNames.add("hidden")
    }
  }
}
