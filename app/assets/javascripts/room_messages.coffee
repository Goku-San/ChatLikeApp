$(document).on 'turbolinks:load', ->
  # Set the vertical scroll of the chat box to bottom
  chat = $('.chat')
  chat.scrollTop(chat[0].scrollHeight) if chat.length

  # Clear the message text box
  roomMessage  = $('#new_room_message')
  textArea     = roomMessage.find('textarea')

  roomMessage.on 'ajax:success', () ->
    if textArea.is('.red-placeholder, .is-invalid')
      console.clear()
      textArea.attr("placeholder", 'Enter your message').removeClass 'red-placeholder is-invalid'

    textArea.val('').focus()

  roomMessage.on 'ajax:error', (event) ->
    errorMessage = JSON.parse(event.detail[2].responseText).errors.message

    textArea.attr("placeholder", errorMessage).addClass('red-placeholder is-invalid').focus()

  # Submit form when pressing enter/return key
  submit_message = () ->
    roomMessage.on 'keydown', (event) ->
      if event.keyCode is 13 && !event.shiftKey
        $('.room-message-btn').click()
        event.target.value = ""
        event.preventDefault()

  submit_message()
