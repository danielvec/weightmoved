import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["addLift", "addGroup", "liftTemplate", "groupTemplate"];
  liftIndex = 0;
  groupIndex = 0;

  addLift(event) {
    event.preventDefault();
    const content = this.liftTemplateTarget.innerHTML.replace(/TEMPLATE_LIFT/g, this.liftIndex);
    this.addLiftTarget.insertAdjacentHTML('beforebegin', content);
    this.liftIndex++;
  }

  addGroup(event) {
    event.preventDefault();
    const content = this.groupTemplateTarget.innerHTML.replace(/TEMPLATE_GROUP/g, this.groupIndex);
    this.addGroupTarget.insertAdjacentHTML('beforebegin', content);
    this.groupIndex++;
  }

  removeField(event) {
    event.preventDefault();
    const item = event.target.closest(".nested-fields");
    item.querySelector("input[name*='_destroy']").value = 1;
    item.remove();
  }
}
