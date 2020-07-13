$(document).on 'turbolinks:load', ->
  # Set the vertical scroll of the chat box to bottom
  chat = $('.chat')
  chat.scrollTop(chat[0].scrollHeight) if chat.length

  # Submit form when pressing enter/return key
  submit_message = () ->
    $('#room_message_message').on 'keydown', (event) ->
      if event.keyCode is 13 && !event.shiftKey
        $('input').click()
        event.target.value = ""
        event.preventDefault()

  submit_message()

# Clear the message text box
$ ->
  $('#new_room_message').on 'ajax:success', (event) ->
    $(@).find('textarea').val ''
