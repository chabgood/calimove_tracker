// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

$('a[disabled]').click(function(e){
  e.stopImmediatePropagation()
  e.preventDefault();
});
