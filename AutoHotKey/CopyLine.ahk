; Copy Line using ctrl + shift + c
^+!q::
	ClipboardTempVar := clipboard
	Send, {home}{home}
	Send, {shift down}{down}{shift up}
	Send, {ctrl down}cvv{ctrl up}
	Send, {up}{home}
	clipboard = %ClipboardTempVar%
return

