import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="modal"
export default class extends Controller {
  static targets = ["newList"]

  open() {
    this.newListTarget.classList.add("show", "d-block") // Show modal
    document.body.classList.add("modal-open") // Prevent background scroll
  }

  close() {
    this.newListTarget.classList.remove("show", "d-block") // Hide modal
    document.body.classList.remove("modal-open")
  }
}
