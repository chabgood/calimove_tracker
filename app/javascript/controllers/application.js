import { Application } from "@hotwired/stimulus"

const application = Application.start()
//= require cocoon
require('jquery')
require('@nathanvda/cocoon')
// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

export { application }
