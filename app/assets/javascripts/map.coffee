# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

root = exports ? this

horizontal_offset = 50
vertical_offset = 150


root.printMousePos = (event) ->
  x_position = event.clientX - horizontal_offset
  y_position = event.clientY - vertical_offset
  $('.clicked_coordinates').html("X Position: #{x_position} - Y Position: #{y_position}")

root.inputClickedCoordinates = (event) ->
  x_position = event.clientX - horizontal_offset
  y_position = event.clientY - vertical_offset
  pair = $('.coordinates.selected')
  pair.find('input:first').val(x_position)
  pair.find('input:last').val(y_position)

  if pair.next().hasClass('coordinates')
    pair.next().addClass('selected')
  else
    pair.closest('form').submit()

  pair.removeClass('selected')

root.drawNewLocation = (event) ->
  x_position = event.clientX
  y_position = event.clientY
  $('#map').append("<div class='new_location' style='left: #{x_position}px; top: #{y_position}px;'></div>")


$(document).on 'click', '.location[data-id]', ->
  $.get("/locations/#{ $(this).data('id') }")
  $('.location').removeClass 'viewing'
  $(this).addClass 'viewing'
  