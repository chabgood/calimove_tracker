// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "./controllers"
import * as bootstrap from "bootstrap"
import '@nathanvda/cocoon'
import Choices from "choices.js/public/assets/styles/choices.css";
document.addEventListener("DOMContentLoaded", function() {
  const selectElements = document.querySelectorAll('select');
  selectElements.forEach(select => {
    new Choices(select, {
      shouldSort: false
    });
  });
});

$('.alert').delay(5000).fadeOut('slow');