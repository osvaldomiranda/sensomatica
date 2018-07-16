App.img_notifications = App.cable.subscriptions.create "ImgNotificationsChannel",
  connected: ->
   # Called when the subscription

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    $('#last_image').html data['message']