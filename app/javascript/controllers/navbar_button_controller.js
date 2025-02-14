import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["button", "navbarButton"];

  connect() {
    this.observer = new IntersectionObserver(
      (entries) => {
        entries.forEach((entry) => {
          if (!entry.isIntersecting) {
            this.showNavbarButton();
          } else {
            this.hideNavbarButton();
          }
        });
      },
      { threshold: 0 } // Trigger as soon as the button is out of view
    );

    this.observer.observe(this.buttonTarget);
  }

  showNavbarButton() {
    this.navbarButtonTarget.classList.remove("d-none");
  }

  hideNavbarButton() {
    this.navbarButtonTarget.classList.add("d-none");
  }
}
