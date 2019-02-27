// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$(document).on('turbolinks:load', function() {
    // enable switch workspace modal
    $('.switch_workspace')
      .on('click', function() {
        $('.ui.modal.select_workspace')
          .modal({
            inverted: true
          })
          .modal('show')
        ;
      })
    ;
});
