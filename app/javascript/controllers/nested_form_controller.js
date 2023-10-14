import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["addField", "Template"];

  addField(event) {
    event.preventDefault();
    const content = this.TemplateTarget.innerHTML.replace(/TEMPLATE_RECORD/g, Math.floor(Math.random() * 20));
    this.addFieldTarget.insertAdjacentHTML('beforebegin', content);
  }

  removeField(event) {
    event.preventDefault();
    const item = event.target.closest(".nested-fields");
    item.querySelector("input[name*='_destroy']").value = 1;
    item.style.display = 'none';
  }
}
