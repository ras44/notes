eho := 0

^j::
Send, My First Script
return

!Numpad5::
MouseGetPos, xpos, ypos 
msg := "The cursor is at X" xpos " Y" ypos " YOS=" ypos + eho
MsgBox, %msg%
return


