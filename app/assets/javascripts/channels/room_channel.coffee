$(document).on 'turbolinks:load', ->
  $('[data-channel-subscribe="room"]').each (index, element) ->
    element = $(element)
    room_id = element.data('room-id')
    messageTemplate = $('[data-role="message-template"]')

    App['room' + room_id] = App.cable.subscriptions.create { channel: "RoomChannel", room: room_id },
      received: (data) ->
        content = messageTemplate.children().clone true, true

        content.find('[data-role="user-avatar"]').attr 'src', data.user_avatar_url
        content.find('[data-role="message-text"]').text data.message
        content.find('[data-role="message-date"]').text data.time_format

        element.append content
        element.scrollTop element[0].scrollHeight
