import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="menu"
export default class extends Controller {
  static targets = ["item"];
  connect() {}

  showMenu() {
    this.itemTargets.forEach((item) => {
      item.classList.toggle("is-active");
    });
  }
}
