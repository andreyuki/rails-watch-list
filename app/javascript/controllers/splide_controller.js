import { Controller } from "@hotwired/stimulus";
import { Splide } from "@splidejs/splide"; // Use named import

export default class extends Controller {
  connect() {
    console.log("Splide controller connected"); // Debugging

    new Splide(this.element, {
      type: "slide",
      perPage: 5,
      perMove: 1,
      gap: "20px",
      pagination: false, // Ensure pagination is disabled
      arrows: true,
      breakpoints: {
        768: { perPage: 2 },
        480: { perPage: 1 }
      }
    }).mount();
  }
}
