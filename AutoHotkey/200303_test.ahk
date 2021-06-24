; resizing historical windows

<^Numpad1::
MouseClick, left, 1049, 593, 2, 0
Send, 60{Enter}
return

<^Numpad2::
MouseClick, left, 1049, 593, 2, 0
Send, 30{Enter}
return

<^Numpad3::
MouseClick, left, 1049, 593, 2, 0
Send, 15{Enter}
return


; choosing 15, 5, 1 min views
<^Numpad4::
MouseClick, left, 587, 120, 1, 0
return

<^Numpad5::
MouseClick, left, 652, 120, 1, 0
return

<^Numpad6::
MouseClick, left, 722, 120, 1, 0
return


; select active quantity
<^Numpad7::
MouseClick, left, 31, 158, 1, 0
Send, ^a
return

; select active price
<^Numpad9::
MouseClick, left, 287, 158, 1, 0
Send, ^a
return

; click buy
<!NumpadAdd::
MouseClick, left, 260, 178, 1, 0
return

; click sell
<!NumpadSub::
MouseClick, left, 315, 178, 1, 0
return
