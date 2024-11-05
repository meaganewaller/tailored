import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="sidebar"
export default class extends Controller {
  static targets = [ "sidebarContainer" ]
  static values = { expanded: Boolean }

  connect() {
    this.mainWrapper = document.getElementById('mainWrapper');
    this.setMainWrapper()
  }

  setMainWrapper() {
    if (this.expandedValue) {
      this.mainWrapper.classList.remove("lg:pl-64")
      this.mainWrapper.classList.remove("lg:pl-20")
      this.mainWrapper.classList.add("lg:pl-64")
    } else {
      this.mainWrapper.classList.remove("lg:pl-64")
      this.mainWrapper.classList.remove("lg:pl-20")
      this.mainWrapper.classList.add("lg:pl-20")
    }
  }

  toggle(e) {
    e.preventDefault();
    this.switchCurrentState();
  }

  switchCurrentState() {
    const expandedCopy = this.expandedValue
    this.expandedValue = !expandedCopy
    this.element.dataset.expanded = this.expandedValue;
    document.cookie = `sidebar_expanded=${this.expandedValue}`;

    this.setMainWrapper();
  }
}
