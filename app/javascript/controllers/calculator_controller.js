import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ 'weight', 'reps', 'totalWeight' ]

  calculateTotalWeight() {
    const weightLifted = this.weightTargets.map((a) => this.getNumericValue(a));
    const repsPerformed = this.repsTargets.map((a) => this.getNumericValue(a));
    const totalLifted = weightLifted.reduce((accumulator, weight, index) => {
      return accumulator + (weight * repsPerformed[index]);
    }, 0);
    this.totalWeightTarget.value = totalLifted;
    }

  getNumericValue(target) {
    return Number(target.value) || 0;
  }
}

