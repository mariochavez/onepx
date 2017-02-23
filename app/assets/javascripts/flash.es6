class Flash {
  constructor() {
    this.flash = document.querySelectorAll('.flash-notice')

    if (this.flash.length > 0) {
      this.timeout = window.setTimeout(this.hideFlash.bind(this), 5000)
    }
  }

  hideFlash() {
    let elements = Array.prototype.slice.call(this.flash)
    elements.forEach(
      function(element) {
        element.classList.add('flash-close')
      }
    )

    window.clearTimeout(this.timeout)
  }
}
