#NoEnv
#Warn
#SingleInstance Force
SetWorkingDir %A_ScriptDir%

IniRead, gui_position, vrhotkeysettings.ini, window position, gui_position, Center
Gui, +Hwndgui_id +AlwaysOnTop
Gui, Add, Text, x10 y2, This window is always on-top!
Gui Add, Button, x10 y20 w100 h23 gRestartVRChat, Restart VRChat
Gui Add, Button, x110 y20 w100 h23 gRestartSteamVR, RestartSteamVR
Gui Add, Button, x210 y20 w100 h23 gRestartBoth, Restart both
Gui Add, Button, x310 y20 w100 h23 gWindowsButton, Windows Button
;Gui Add, Button, x350 y8 w110 h23 gTaskManager, Task Manager
Gui Show, %gui_position% w250 h100 w420 h50, VR force restart shortcuts V1.1

; Get EXE paths
;RegRead, VRChatPath, HKEY_CURRENT_USER\System\GameConfigStore\Children\dd15502a-4fd0-48a3-9ea7-bf3f0c5a60ff, MatchedExeFullPath
RegRead, SteamVRpath, HKEY_CLASSES_ROOT\vrmonitor\Shell\Open\Command, 
Return

GuiEscape:
GuiClose:
	WinGetPos, gui_x, gui_y,,, ahk_id %gui_id%
	IniWrite, x%gui_x% y%gui_y%, vrhotkeysettings.ini, window position, gui_position
ExitApp


WindowsButton:
	Send {LWin}
	Process Exist, Beat Saber.exe
	PID := ErrorLevel
	Process, Priority, %PID%, high
return

RestartVRChat:
	Run taskkill.exe /F /IM vrchat.exe,, Hide
	Run taskkill.exe /F /IM vrchat.exe,, Hide
	Run taskkill.exe /F /IM vrchat.exe,, Hide
	Run taskkill.exe /F /IM vrchat.exe,, Hide
	Run taskkill.exe /F /IM start_protected_game.exe,, Hide
	Run taskkill.exe /F /IM start_protected_game.exe,, Hide
	Run taskkill.exe /F /IM start_protected_game.exe,, Hide
	Run taskkill.exe /F /IM start_protected_game.exe,, Hide
	Run taskkill.exe /F /IM EasyAntiCheat_EOS.exe,, Hide
	Run taskkill.exe /F /IM EasyAntiCheat_EOS.exe,, Hide
	Run taskkill.exe /F /IM EasyAntiCheat_EOS.exe,, Hide
	Run taskkill.exe /F /IM EasyAntiCheat_EOS.exe,, Hide
	sleep 1000
	;Run %VRChatPath%
	Run steam://rungameid/438100
	;Get process ID to set the process to high priority
	sleep 10000
	Process Exist, VRChat.exe
	PID := ErrorLevel
	Process, Priority, %PID%, high
	;Minimize window to reduce load on gpu
	sleep 10000
	WinMinimize, ahk_pid %PID% 
return


RestartSteamVR:
	Run taskkill.exe /F /IM vrmonitor.exe,, Hide
	Run taskkill.exe /F /IM vrmonitor.exe,, Hide
	Run taskkill.exe /F /IM compositor.exe,, Hide
	Run taskkill.exe /F /IM compositor.exe,, Hide
	Run taskkill.exe /F /IM vrserver.exe,, Hide
	Run taskkill.exe /F /IM vrserver.exe,, Hide
	sleep 500
	run %SteamVRpath%
return

RestartBoth:
	Run taskkill.exe /F /IM vrmonitor.exe,, Hide
	Run taskkill.exe /F /IM vrmonitor.exe,, Hide
	Run taskkill.exe /F /IM compositor.exe,, Hide
	Run taskkill.exe /F /IM compositor.exe,, Hide
	Run taskkill.exe /F /IM vrserver.exe,, Hide
	Run taskkill.exe /F /IM vrserver.exe,, Hide
	sleep 500
	run %SteamVRpath%
	sleep 5000
	Run taskkill.exe /F /IM vrchat.exe,, Hide
	Run taskkill.exe /F /IM vrchat.exe,, Hide
	Run taskkill.exe /F /IM vrchat.exe,, Hide
	Run taskkill.exe /F /IM vrchat.exe,, Hide
	Run taskkill.exe /F /IM start_protected_game.exe,, Hide
	Run taskkill.exe /F /IM start_protected_game.exe,, Hide
	Run taskkill.exe /F /IM start_protected_game.exe,, Hide
	Run taskkill.exe /F /IM start_protected_game.exe,, Hide
	Run taskkill.exe /F /IM EasyAntiCheat_EOS.exe,, Hide
	Run taskkill.exe /F /IM EasyAntiCheat_EOS.exe,, Hide
	Run taskkill.exe /F /IM EasyAntiCheat_EOS.exe,, Hide
	Run taskkill.exe /F /IM EasyAntiCheat_EOS.exe,, Hide
	sleep 1000
	;Run %VRChatPath%
	Run steam://rungameid/438100
	;Get process ID to set the process to high priority
	sleep 10000
	Process Exist, VRChat.exe
	PID := ErrorLevel
	Process, Priority, %PID%, high
	;Minimize window to reduce load on gpu
	sleep 10000
	WinMinimize, ahk_pid %PID% 
return


; End of the GUI section