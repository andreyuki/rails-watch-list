import { Application } from "@hotwired/stimulus"
import SplideController from "./splide_controller";

const application = Application.start()
application.register("splide", SplideController);

// Configure Stimulus development experience
application.debug = false
window.Stimulus = application

export { application }
