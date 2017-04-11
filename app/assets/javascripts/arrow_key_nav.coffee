window.onkeyup = (e) ->
    key = if e.keyCode
        e.keyCode 
    else
        e.which
    
    if (key == 37 || key == 65) # left or a
        $.get('player/move_left')
    else if (key == 38 || key == 87) # up or w
        $.get('player/move_up')
    else if (key == 39 || key == 68) # right or d
        $.get('player/move_right')
    else if (key == 40 || key == 83) # down or s
        $.get('player/move_down')
    
