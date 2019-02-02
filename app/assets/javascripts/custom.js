$(document).on('turbolinks:load', function() {
    // enable semanti ui dropdown
    $('.ui.dropdown')
      .dropdown()
    ;
    // enable semantic ui message dismissal
    $('.message .close')
      .on('click', function() {
        $(this)
          .closest('.ui.flash.container')
          .transition('scale')
        ;
      })
    ;
    // make flash messages draw attention to themselves
    $('.flash.message')
      .transition('pulse')
    ;
});
