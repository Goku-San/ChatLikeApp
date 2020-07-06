# Set the vertical scroll of the chat box to bottom
$(document).on 'turbolinks:load', ->
  chat = $('.chat')
  chat.scrollTop(chat[0].scrollHeight)

# Clear the message text box
$ ->
  $('#new_room_message').on 'ajax:success', (event) ->
    $(@).find('textarea').val ''
