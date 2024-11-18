import { Controller } from "@hotwired/stimulus";
import { Modal } from "bootstrap";

export default class extends Controller {
  connect() {}

  submitForm() {
    // createExpenseForm.submit();
  }

  openDialog() {
    new Modal("#createExpense").show();
  }
}
