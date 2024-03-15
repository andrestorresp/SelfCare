import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="checkbox"
export default class extends Controller {
  connect() {
      const submitButton = document.getElementById("submit_button");
      function handleCheckBoxPair(trueCheckbox, falseCheckbox) {
          function checkBothCheckboxes() {
              if (trueCheckbox.checked || falseCheckbox.checked) {
                  submitButton.disabled = false;
              } else {
                  submitButton.disabled = true;
              }
          }
          trueCheckbox.addEventListener("change", function() {
              if (trueCheckbox.checked) {
                  falseCheckbox.checked = false;
              }
              checkBothCheckboxes();
          });
          falseCheckbox.addEventListener("change", function() {
              if (falseCheckbox.checked) {
                  trueCheckbox.checked = false;
              }
              checkBothCheckboxes();
          });
      }
      const checkBoxPairs = document.querySelectorAll('.form-check-input[type="checkbox"]');
      for (let i = 0; i < checkBoxPairs.length; i += 2) {
          const trueCheckbox = checkBoxPairs[i];
          const falseCheckbox = checkBoxPairs[i + 1];
          handleCheckBoxPair(trueCheckbox, falseCheckbox);
      }
      checkBoxPairs.forEach(function(checkbox) {
          checkbox.addEventListener("change", function() {
              let allPairsChecked = true;
              for (let i = 0; i < checkBoxPairs.length; i += 2) {
                  const trueCheckbox = checkBoxPairs[i];
                  const falseCheckbox = checkBoxPairs[i + 1];
                  if (!trueCheckbox.checked && !falseCheckbox.checked) {
                      allPairsChecked = false;
                      break;
                  }
              }
              if (allPairsChecked) {
                  submitButton.disabled = false;
              } else {
                  submitButton.disabled = true;
              }
          });
      });


  }
}
