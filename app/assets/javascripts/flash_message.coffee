root = exports ? this

root.flash = (message) ->
  template = $('template#flash').html().replace('message', message)
  $('#messages').append(template)

  activate_flash = ->
    $('.flash.inactive').removeClass('inactive')
  deactivate_flash = ->
    $('.flash:last').addClass('hidden')

  window.setTimeout(activate_flash, 10)
  window.setTimeout(deactivate_flash, 3500)

$(document).on 'click', '.flash', ->
  $(this).addClass 'hidden'
