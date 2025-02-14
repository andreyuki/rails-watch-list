const application = Stimulus.Application.start()

application.register("viewport-entrance-toggle", class extends Stimulus.Controller {

  initialize() {
    this.intersectionObserver = new IntersectionObserver(entries => this.processIntersectionEntries(entries))
  }

  connect() {
    this.intersectionObserver.observe(this.element)
  }

  disconnect() {
    this.intersectionObserver.unobserve(this.element)
  }

  // Private

  processIntersectionEntries(entries) {
    entries.forEach(entry => {
      this.element.classList.toggle(this.data.get("class"), entry.isIntersecting)
    })
  }
})
