import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="create-waste"
export default class extends Controller {
  static targets = ["solidFields", "liquidFields"];
  connect() {
    console.log("Hello from create-waste controller");
  }

  toggle() {
    const solidRadioButton = document.querySelector(
      'input[name="waste[waste_type]"][value="Solide"]'
    );
    const RadioButton = document.querySelector(
      'input[name="waste[waste_type]"][value="Liquide"]'
    );

    if (solidRadioButton.checked) {
      this.solidFieldsTarget.style.display = "block";
      this.liquidFieldsTarget.style.display = "none";
    } else {
      this.solidFieldsTarget.style.display = "none";
      this.liquidFieldsTarget.style.display = "block";
    }
  }
}
