//= require cable
//= require_self
//= require_tree .

this.App = {};

App.cable = ActionCable.createConsumer();

App.locations = App.cable.subscriptions.create('LocationsChannel', {
  received: function(data) {
    return $('boddy').append(this.renderMessage(data));
  },

  renderMessage: function(data) {
    return "<p> <b>" + data.lat + data.lng ": </b>" + "</p>";
  }
});
