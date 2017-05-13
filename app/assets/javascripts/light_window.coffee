root = exports ? this

root.activate_light_window = (target) ->
  template = $("template.#{target}")
  curtain_and_window = $('#light_window_template').html()
  $('body').append curtain_and_window
  $('.light_window').html(template.html())
  setTimeout(reveal_curtain, 100)
  setTimeout(reveal_light_window, 100)

root.deactivate_light_window = ->
  hide_light_window()
  setTimeout(hide_curtain, 150)
  setTimeout(remove_light_window, 100)

remove_light_window = ->
  $('.curtain').remove()

reveal_curtain = ->
  $('.curtain').removeClass 'hidden'

hide_curtain = ->
  $('.curtain').addClass 'hidden'



reveal_light_window = ->
  $('.light_window').removeClass 'hidden'

hide_light_window = ->
  $('.light_window').addClass 'hidden'

$(document).on 'click', '.close_light_window', ->
  deactivate_light_window()
  
$(document).on 'click', '.activate_light_window', ->
  activate_light_window($(this).data('target'))
