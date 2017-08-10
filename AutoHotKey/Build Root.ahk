#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.


WorkspaceENV = D:\Users\Jeffrey\Documents\Inetpub


; Opens, builds, and closes ECP_Root
^+!e::
	Run, %WorkspaceENV%\ECP_Root\ECP_Root.sln
	Sleep, 5000
	Send, {alt}BR
	Sleep, 2500
	Send, {alt down}{f4}{alt up}
Return
