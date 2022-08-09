import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="reset"
export default class extends Controller {
  static targets = ["point", "pointStatus"];
  static values = { property: String, reset: String };

  pointStatusTargetConnected(e) {
    if (e.className === "hide_point") {
      this.pointTargets.forEach(target => {
        target[this.propertyValue] = this.resetValue;
      });
    }
  }
}
