WorkspaceENV = D:\Users\Jeffrey\Documents\Inetpub


; Rebuild using ctrl + shift + r
^+r::
	Send, !BR
return


; Debug using ctrl + shift + d
^+d::
	Send, !Dpw3wp{enter}
return

; Copy Line using ctrl + shift + c
^+c::
	ClipboardTempVar := clipboard
	Send, {home}{home}
	Send, {shift down}{down}{shift up}
	Send, {ctrl down}cvv{ctrl up}
	Send, {up}{up}{end}
	clipboard = %ClipboardTempVar%
return


; Opens, builds, and closes ECP_Root
^+!e::
	Run, %WorkspaceENV%\ECP_Root\ECP_Root.sln
	Sleep, 5000
	Send, {alt}BR
	Sleep, 3000
	Send, {alt down}{f4}{alt up}
return

