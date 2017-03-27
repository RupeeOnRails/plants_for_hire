root = exports ? this

root.activate_light_window = ->
  reveal_curtain()
  window.setTimeout(reveal_light_window, 100)

root.deactivate_light_window = ->
  hide_light_window()
  window.setTimeout(hide_curtain, 150)

root.toggle_light_window = ->
  

reveal_curtain = ->
  $('#curtain').removeClass 'hidden'

hide_curtain = ->
  $('#curtain').addClass 'hidden'



reveal_light_window = ->
  $('#light_window').removeClass 'hidden'

hide_light_window = ->
  $('#light_window').addClass 'hidden'

$(document).on 'click', '#close_light_window', ->
  deactivate_light_window()
  
$(document).on 'click', '#activate_light_window', ->
  activate_light_window()
