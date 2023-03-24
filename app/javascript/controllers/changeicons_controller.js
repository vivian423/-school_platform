import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="changeicons"
export default class extends Controller {
  static targets = ["icon"]
  connect() {
    console.log(this.iconTargets)

    console.log("I am connected")
  }

  color() {
    if (this.iconTarget.clicked) {
      this.iconTarget.classList.add("active")
    } else {
      this.iconTarget.classList.remove("active")
    }
  }
    // this.iconTargets.map(elem => elem.add("active"))

}
