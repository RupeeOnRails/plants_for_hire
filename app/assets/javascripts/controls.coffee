$(document).on 'click', '#volume_button', ->
  mute()

$(document).on 'click', '#volume_button.muted', ->
  unmute()

mute = ->
  m = document.getElementById('music')
  m.pause()
  $('#volume_button').addClass 'muted'
  $('#volume_button').find('i').html('volume_off')

unmute = ->
  m = document.getElementById('music')
  m.play()
  $('#volume_button').removeClass 'muted'
  $('#volume_button').find('i').html('volume_up')
