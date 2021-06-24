;eho := 0
eho := 15

; resizing historical windows

<^Numpad1::
MouseClick, left, 1049, 593, 2, 0
Send, 60{Enter}
MouseClick, left, 458, 243, 1, 0
return

<^Numpad2::
MouseClick, left, 1049, 593, 2, 0
Send, 30{Enter}
MouseClick, left, 458, 243, 1, 0
return

<^Numpad3::
MouseClick, left, 1049, 593, 2, 0
Send, 15{Enter}
MouseClick, left, 458, 253, 1, 0
return


; choosing 15, 5, 1 min views
<^Numpad4::
MouseClick, left, 587, 105+eho, 1, 0
MouseClick, left, 458, 253, 1, 0
return

<^Numpad5::
MouseClick, left, 652, 105+eho, 1, 0
MouseClick, left, 458, 253, 1, 0
return

<^Numpad6::
MouseClick, left, 722, 105+eho, 1, 0
MouseClick, left, 458, 253, 1, 0
return


; select active quantity
<^Numpad7::
MouseClick, left, 31, 135+eho, 1, 0
Send, ^a
return

; select active price
<^Numpad9::
MouseClick, left, 287, 135+eho, 1, 0
Send, ^a
return

; click buy
<!NumpadAdd::
MouseClick, left, 260, 165+eho, 1, 0
MouseClick, left, 458, 253, 1, 0
return

; click sell
<!NumpadSub::
MouseClick, left, 315, 165+eho, 1, 0
MouseClick, left, 458, 253, 1, 0
return

; click on all-in-one
<^NumpadDiv::
MouseClick, left, 458, 253, 1, 0
return


; click ticker
<^t::
MouseClick, left, 554, 76, 1, 0
return


; vertical zoom in
<^NumpadAdd::
SendEvent {Click 1050, 289, down}{click 1050, 257, up}
MouseClick, left, 458, 253, 1, 0
return

; vertical zoom out
<^NumpadSub::
SendEvent {Click 1050, 257, down}{click 1050, 289, up}
MouseClick, left, 458, 253, 1, 0
return


; create levels for a ticker
<^l::

line_loc_x := 842

InputBox, level_low, Level Low, Position mouse at low and enter dollar value
MouseGetPos, xposl, yposl
InputBox, level_high, Level High, Position mouse at high and enter dollar value
MouseGetPos, xposh, yposh
if ErrorLevel {
	MsgBox, CANCEL was pressed.	
}
else{

	Gui, Add, Tab2,, Level Entry
	Gui, Add, Edit, vlevels r15 
	Gui, Tab  ; i.e. subsequently-added controls will not belong to the tab control.
	Gui, Add, Button, default xm, OK  ; xm puts it at the bottom left corner.
	Gui, Show
	return

	ButtonOK:
	GuiClose:
	GuiEscape:
	Gui, Submit  ; Save each control's contents to its associated variable.
	MsgBox "Press enter to generate levels"

	; click "Horizontal line"
	MouseClick, left, 1176, 270+eho, 1, 0

	Loop, parse, levels, `n, `r
	{

		line_number := A_Index
		; MsgBox Line %line_number% is %A_LoopField%.
		row_str := A_LoopField
		Loop, parse, row_str, CSV
		{
			col := A_Index
			val := A_LoopField
	  	if(Mod(col,2)=0){
	  		if ((val >= level_low) and (val <= level_high) )
	  		{
	  	  	line_loc_y := yposl-(val-level_low)/(level_high-level_low)*(yposl-yposh)
	  	  	;MsgBox "Creating line for %val% at %line_loc_y% between %level_low% and %level_high%"
	  	  	MouseClick, left, line_loc_x, line_loc_y, 1, 0
	  		}
	  	}
		}
	}

	Gui, Destroy

	; unclick "Horizontal line"
	MsgBox "Unclick horizontal line"
	MouseClick, left, 1176, 270+eho, 1, 0
	; reset to all-in-one
	MsgBox "Reset to all-in-one"
	MouseClick, left, 458, 253, 1, 0

	return

}
