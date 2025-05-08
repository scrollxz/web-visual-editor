import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static values = {
    frame: String,
    removeContentOnClose: true,
  };

  connect() {
    const element = this.element;
    element.parentElement.classList.remove("hidden");
  }

  submitEnd(e) {
    if (e.detail.success) {
      this.close();
    }
  }

  close() {
    const element = this.element;
    element.removeAttribute("reloadable");
    element.removeAttribute("src");

    if (this.removeContentOnCloseValue == false) {
      element.parentElement.classList.toggle("hidden", true);
    } else {
      element.parentElement.innerHTML = "";
    }
  }
}
