App.process_disbursement = App.cable.subscriptions.create("ProcessDisbursementChannel", {
  connected: function() {
    // Called when the subscription is ready for use on the server
  },

  disconnected: function() {
    // Called when the subscription has been terminated by the server
  },

  received: function(data) {
    // Called when there's incoming data on the websocket for this channel

    // set transfer status in view
    $(data['status_cell_id']).html(data['status']);

    // activate loader
    if(data['make_loader_active'] == 'true'){
      $('#disbursement_loader').attr('class', 'ui active inline loader');
    }

    // disable loader
    if(data['make_loader_active'] == 'false'){
      $('#disbursement_loader').attr('class', 'ui disabled inline loader');
    }
  }
});
